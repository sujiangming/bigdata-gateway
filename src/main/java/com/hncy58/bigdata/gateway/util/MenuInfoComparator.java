package com.hncy58.bigdata.gateway.util;

import java.util.Comparator;

import com.hncy58.bigdata.gateway.domain.MenuInfo;

public class MenuInfoComparator implements Comparator<MenuInfo> {

	@Override
	public int compare(MenuInfo m1, MenuInfo m2) {

		int ret = 0;

		if (m1 == null || m2 == null)
			return ret;

		ret = m1.getpResCode().compareTo(m2.getpResCode());
		// same parent res
		if (ret == 0) {
			// 相同parent则按照排名排序
			ret = m1.getRank() - m2.getRank();
			// 如果排名相同则按照资源编码排序
			if (ret == 0) {
				ret = m1.getResCode().compareTo(m2.getResCode());
			}
		} else {
			// 如果不是同一个父资源，则按照编码进行排序
			// ret = res1.getResCode().length() - res2.getResCode().length();
			ret = m1.getResCode().compareTo(m2.getResCode());
		}

		return ret;
	}

}
