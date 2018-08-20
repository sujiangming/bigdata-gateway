package com.hncy58.bigdata.gateway.service.imlp;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.UserDomain;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.mapper.RoleMapper;
import com.hncy58.bigdata.gateway.mapper.UserMapper;
import com.hncy58.bigdata.gateway.model.Role;
import com.hncy58.bigdata.gateway.model.User;
import com.hncy58.bigdata.gateway.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private RoleMapper roleMapper;

	@Transactional(readOnly = true)
	@Override
	public User selectByPrimaryKey(int id) {
		User u = userMapper.selectByPrimaryKey(id);
		return u;
	}

	@Transactional(readOnly = true)
	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		int ret = userMapper.deleteByPrimaryKey(id);
		return ret;
	}

	@Override
	public int insert(User user) {
		userMapper.insert(user);
		return user.getId();
	}

	@Override
	public int updateByPrimaryKeySelective(User user) {
		int ret = userMapper.updateByPrimaryKeySelective(user);
		return ret;
	}

	@Override
	public int updateByPrimaryKey(User user) {
		int ret = userMapper.updateByPrimaryKey(user);
		return ret;
	}

	/*
	 * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
	 * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可； pageNum 开始页数 pageSize
	 * 每页显示的数据条数
	 */
	@Transactional(readOnly = true)
	@Override
	public Page<User> selectAll(int pageNum, int pageSize, UserDomain queryUser) {
		Page<User> page = PageHelper.startPage(pageNum, pageSize, true);
		userMapper.select(queryUser);
		log.debug("total user : {}", page.getTotal());
		log.debug("ret users : {}", page.getResult());

		Page<User> pageRet = new Page<>(pageNum, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
		// return page.getResult();
	}

	@Override
	public User selectByUserCode(String userCode) {

		return userMapper.selectByUserCode(userCode);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int linkRole(String userId, List<String> allRoleIds) {

		List<Role> linkedRoles = roleMapper.getRoleByUserId(userId);

		List<String> addRoleIds = new ArrayList<>();
		List<String> unlinkRoleIds = new ArrayList<>();

		if (!linkedRoles.isEmpty()) {
			fillUnlinkAndAddRoleIds(unlinkRoleIds, addRoleIds, allRoleIds, linkedRoles);
		} else {
			addRoleIds = allRoleIds;
		}

		int added = 0;
		int deleted = 0;
		if (!unlinkRoleIds.isEmpty()) {
			deleted = userMapper.unlinkRoles(userId, new ArrayList<>(unlinkRoleIds));
			log.info("unlink roles, user:{}, roles:{}, ret:{}", userId, unlinkRoleIds, deleted);
		}

		if (!addRoleIds.isEmpty()) {
			added = userMapper.linkRoles(userId, new ArrayList<>(addRoleIds));
			log.info("add roles, user:{}, roles:{}, ret:{}", userId, addRoleIds, added);
		}

		return deleted + added;
	}

	/**
	 * 填充需要移除和增加的角色关联关系
	 * 
	 * @param unlinkRoleIds
	 *            待移除的角色
	 * @param addRoleIds
	 *            待增加的角色
	 * @param allRoleIds
	 *            所有用户关联的角色
	 * @param linkedRoles
	 *            已经关联的角色
	 */
	private void fillUnlinkAndAddRoleIds(List<String> unlinkRoleIds, List<String> addRoleIds, List<String> allRoleIds,
			List<Role> linkedRoles) {

		Set<String> linkedRoleIds = linkedRoles.stream().map(role -> role.getId() + "").distinct()
				.collect(Collectors.toSet());
		addRoleIds.addAll(
				allRoleIds.stream().filter(id -> !linkedRoleIds.contains(id)).distinct().collect(Collectors.toList()));
		unlinkRoleIds.addAll(
				linkedRoleIds.stream().filter(id -> !allRoleIds.contains(id)).distinct().collect(Collectors.toList()));
	}

	@Override
	public int unLinkRole(String userId, List<String> roleIds) throws RestfulJsonException {
		return userMapper.unlinkRoles(userId, roleIds);
	}

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int delete(List<String> ids) {
		int num = userMapper.delete(ids);
		if (num > 0) {
			userMapper.unlinkUserRoles(ids);
		}
		return num;
	}

	@Override
	public List<User> selectUserByRole(List<String> roleIds) {
		return userMapper.selectUserByRole(roleIds);
	}
	
	@Override
	public List<User> selectUserByRes(List<String> resIds) {
		return userMapper.selectUserByRes(resIds);
	}

}
