package com.hncy58.bigdata.gateway.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.github.pagehelper.PageException;
import com.hncy58.bigdata.gateway.domain.MenuInfo;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.model.AuthInfo;
import com.hncy58.bigdata.gateway.model.Resource;

/**
 * 工具类
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月9日 下午12:57:27
 */
public class Utils {

	public static boolean hasSuperRole(AuthInfo auth) {
		return auth.getRoles().stream().filter(role -> role.getRoleId() == Constant.ADMIN_ROLE_ID).count() > 0;
	}

	private static List<MenuInfo> treeMenuList(List<MenuInfo> menuList, String parentCode) {
		List<MenuInfo> menus = new ArrayList<>();
		for (MenuInfo menu : menuList) {
			String code = menu.getResCode();
			String pCode = menu.getpResCode();
			if (parentCode.equals(pCode)) {
				List<MenuInfo> childMenus = treeMenuList(menuList, code);
				menu.setSubMenus(childMenus);
				menus.add(menu);
			}
		}

		sortMenus(menus);

		return menus;
	}

	/**
	 * 对菜单进行排序
	 * 
	 * @param menus
	 */
	private static void sortMenus(List<MenuInfo> menus) {
		Collections.sort(menus, new MenuInfoComparator());
		menus.forEach(menu -> sortMenus(menu.getSubMenus()));
	}

	public static Object generateMenu(AuthInfo authInfo) {
		Set<Resource> reses = new HashSet<>();
		authInfo.getRoles().forEach(role -> {
			role.getResources().forEach(res -> {
				reses.add(res);
			});
		});

		return generateMenu(new ArrayList<>(reses));
	}

	public static Object generateMenu(List<Resource> reses) {
		MenuInfo root = null;
		boolean findRoot = false;
		List<MenuInfo> menus = new ArrayList<>();
		List<Resource> rootReses = new ArrayList<>();

		for (Resource res : reses) {
			menus.add(MenuInfo.resourceToMenu(res));
			if(StringUtils.isEmpty(res.getResCode()))
				continue;
			if (res.getResCode().equals(Constant.RES_ROOT_CODE)) {
				root = MenuInfo.resourceToMenu(res);
				findRoot = true;
			} else if (root == null) {
				root = MenuInfo.resourceToMenu(res);
			} else if (!findRoot) {
				int rootCodeLen = root.getResCode().length();
				int resCodeLen = res.getResCode().length();
				if (rootCodeLen > resCodeLen) {
					root = MenuInfo.resourceToMenu(res);
					// 替换root节点之后，root节点集合需要重新初始化
					rootReses = new ArrayList<>();
					rootReses.add(res);
				} else if (rootCodeLen == resCodeLen) {
					// 如果相等曾增加一个root节点
					rootReses.add(res);
				}
			}
		}

		if (root == null)
			return Collections.emptyList();

		if (findRoot)
			return treeMenuList(menus, root.getResCode());

		List<MenuInfo> retMenues = new ArrayList<>();
		rootReses.forEach(res -> {
			MenuInfo menu = MenuInfo.resourceToMenu(res);
			menu.setSubMenus(treeMenuList(menus, menu.getResCode()));
			retMenues.add(menu);
		});
		
		return retMenues;
	}
	
	public static void handleRestfulJsonException(Exception e) throws RestfulJsonException {
		if( e instanceof RestfulJsonException) {
			throw (RestfulJsonException) e;
		}
		throw new RestfulJsonException(e.getMessage(), e);
	}
	
	public static void handlePageException(Exception e) throws PageException {
		if( e instanceof PageException) {
			throw (PageException) e;
		}
		throw new PageException(e.getMessage(), e);
	}

}
