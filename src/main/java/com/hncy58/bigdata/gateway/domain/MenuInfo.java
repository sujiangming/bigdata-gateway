package com.hncy58.bigdata.gateway.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.hncy58.bigdata.gateway.model.Resource;

public class MenuInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String resCode;
	private String resName;
	private String pResCode;
	private String resUri;
	private int rank;
	private String mark;
	private String resIcon;
	private List<MenuInfo> subMenus;

	public MenuInfo() {
		super();
	}

	public MenuInfo(int id, String resCode, String resName, String pResCode, String resUri, int rank, String mark,
			String resIcon, List<MenuInfo> subMenus) {
		super();
		this.id = id;
		this.resCode = resCode;
		this.resName = resName;
		this.pResCode = pResCode;
		this.resUri = resUri;
		this.rank = rank;
		this.mark = mark;
		this.resIcon = resIcon;
		this.subMenus = subMenus;
	}

	public String getResIcon() {
		return resIcon;
	}

	public void setResIcon(String resIcon) {
		this.resIcon = resIcon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getpResCode() {
		return pResCode;
	}

	public void setpResCode(String pResCode) {
		this.pResCode = pResCode;
	}

	public String getResUri() {
		return resUri;
	}

	public void setResUri(String resUri) {
		this.resUri = resUri;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public List<MenuInfo> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<MenuInfo> subMenus) {
		this.subMenus = subMenus;
	}

	public static MenuInfo resourceToMenu(Resource res) {
		return new MenuInfo(res.getId(), res.getResCode(), res.getResName(), res.getpResCode(), res.getResUri(),
				res.getRank(), res.getMark(), res.getResIcon(), new ArrayList<>());
	}

	@Override
	public String toString() {
		return "{code:" + this.getResCode() + ", pCode:" + this.getpResCode() + ", rank:" + this.getRank()
				+ ", subMenus:" + this.getSubMenus() + "}";
	}

}
