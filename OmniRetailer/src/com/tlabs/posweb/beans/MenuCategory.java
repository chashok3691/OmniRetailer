package com.tlabs.posweb.beans;

import java.util.List;

public class MenuCategory {

//	private byte[] category_icon;
	private String old_category_name;
	private String category_name;
	private String category_desc;
	//private byte[] category_icon;
	private String category_icon;
	private String categoryIcons;
	private int slNo;
    private String categoryIconRef;
    private boolean categroyIconFlag;
	private String imgName;
	private boolean deleteImage;
	private String menu_category_id;
	
	private String menu_name;
	private boolean menu_status;
	
	
	
	public boolean isMenu_status() {
		return menu_status;
	}
	public void setMenu_status(boolean menu_status) {
		this.menu_status = menu_status;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	private List<MenuItems> menuItemsList;
	
	public List<MenuItems> getMenuItemsList() {
		return menuItemsList;
	}
	public void setMenuItemsList(List<MenuItems> menuItemsList) {
		this.menuItemsList = menuItemsList;
	}
	private String sno;
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_desc() {
		return category_desc;
	}
	public void setCategory_desc(String category_desc) {
		this.category_desc = category_desc;
	}
	/*public byte[] getCategory_icon() {
		return category_icon;
	}
	public void setCategory_icon(byte[] category_icon) {
		this.category_icon = category_icon;
	}*/
	public String getOld_category_name() {
		return old_category_name;
	}
	public void setOld_category_name(String old_category_name) {
		this.old_category_name = old_category_name;
	}
	public String getCategory_icon() {
		return category_icon;
	}
	public void setCategory_icon(String category_icon) {
		this.category_icon = category_icon;
	}
	public String getCategoryIcons() {
		return categoryIcons;
	}
	public void setCategoryIcons(String categoryIcons) {
		this.categoryIcons = categoryIcons;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getCategoryIconRef() {
		return categoryIconRef;
	}
	public void setCategoryIconRef(String categoryIconRef) {
		this.categoryIconRef = categoryIconRef;
	}
	public boolean isCategroyIconFlag() {
		return categroyIconFlag;
	}
	public void setCategroyIconFlag(boolean categroyIconFlag) {
		this.categroyIconFlag = categroyIconFlag;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public boolean isDeleteImage() {
		return deleteImage;
	}
	public void setDeleteImage(boolean deleteImage) {
		this.deleteImage = deleteImage;
	}
	public String getMenu_category_id() {
		return menu_category_id;
	}
	public void setMenu_category_id(String menu_category_id) {
		this.menu_category_id = menu_category_id;
	}
	
	

}
