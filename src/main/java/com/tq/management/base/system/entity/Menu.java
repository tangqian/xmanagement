package com.tq.management.base.system.entity;

import java.io.Serializable;
import java.util.List;

import com.tq.management.base.entity.SuperEntity;

/**
 * @version 1.0
 * @author tangqian
 */
public class Menu extends SuperEntity implements Serializable {

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public List<Menu> getSubs() {
		return subs;
	}

	public void setSubs(List<Menu> subs) {
		this.subs = subs;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Menu parent;
	private List<Menu> subs;
	private String name;
	private String url;
	private Integer parentId;
	private Integer orderId;
	private String icon;
	private Integer type;
	private String description;

	@Override
	public void addInit() {
		if (parentId == null)
			parentId = 0;
		if (orderId == null)
			orderId = 0;
		if (icon == null)
			icon = "";
		if (type == null)
			type = 1;
		if (description == null)
			description = "";

	}

}
