package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

public class MenuItems {
	
	private String category_name;
	private String item_name;
	private String item_desc;  // map to this 
	private String item_type;
	private String unit_of_measurement;;
	private String qty;
	private String unit_price;
	private String item_availability;
	/*private byte[] item_icon;
	private byte[] item_picture1;
	private byte[] item_picture2;*/
	private String pluCode;
	private String sku_id;
	private float	mrp=0f;
	
	
	public float getMrp() {
		return mrp;
	}
	public void setMrp(float mrp) {
		this.mrp = mrp;
	}
	public String getSku_id() {
		return sku_id;
	}
	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	private String item_icon;
	private String item_picture1;
	private String item_picture2;
	
	private List<String> deleteMenuItems;
	
	public List<String> getDeleteMenuItems() {
		return deleteMenuItems;
	}
	public void setDeleteMenuItems(List<String> deleteMenuItems) {
		this.deleteMenuItems = deleteMenuItems;
	}
	private String sno;
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getItem_icon() {
		return item_icon;
	}
	public void setItem_icon(String item_icon) {
		this.item_icon = item_icon;
	}
	public String getItem_picture1() {
		return item_picture1;
	}
	public void setItem_picture1(String item_picture1) {
		this.item_picture1 = item_picture1;
	}
	public String getItem_picture2() {
		return item_picture2;
	}
	public void setItem_picture2(String item_picture2) {
		this.item_picture2 = item_picture2;
	}
	private String item_icons;
	private String item_pictures1;
	private String item_pictures2;
	private int slNo;

	private String itemIconRef;
	private String itemPicture1Ref;
	private String itemPicture2Ref;
	
	private boolean itemIconFlag;
	private boolean itemPicture1Flag;
	private boolean itemPicture2Flag;
	private int menu_item_id;
	private boolean deleteImageIcon;
	private boolean deletePic1;
	private boolean deletePic2;
	
	
	
	private String	menu_name;
	private Date createdOn;
	private Date updatedOn;
	
	private String measureRange;
	private String productRange;
	private String size;
	private String color;
	private String utility;
	private String styleRange;
	private String materialType;
	private String department;
	
	
	

	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getUtility() {
		return utility;
	}
	public void setUtility(String utility) {
		this.utility = utility;
	}
	public String getStyleRange() {
		return styleRange;
	}
	public void setStyleRange(String styleRange) {
		this.styleRange = styleRange;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	private String searchCriteria;	
	private List<String> locationsList; 
	private String startIndex;
	private RequestHeader	requestHeader;
	
	
	
	
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public Date getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_desc() {
		return item_desc;
	}
	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getUnit_of_measurement() {
		return unit_of_measurement;
	}
	public void setUnit_of_measurement(String unit_of_measurement) {
		this.unit_of_measurement = unit_of_measurement;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(String unit_price) {
		this.unit_price = unit_price;
	}
	public String getItem_availability() {
		return item_availability;
	}
	public void setItem_availability(String item_availability) {
		this.item_availability = item_availability;
	}
	/*public byte[] getItem_icon() {
		return item_icon;
	}
	public void setItem_icon(byte[] item_icon) {
		this.item_icon = item_icon;
	}
	public byte[] getItem_picture1() {
		return item_picture1;
	}
	public void setItem_picture1(byte[] item_picture1) {
		this.item_picture1 = item_picture1;
	}
	public byte[] getItem_picture2() {
		return item_picture2;
	}
	public void setItem_picture2(byte[] item_picture2) {
		this.item_picture2 = item_picture2;
	}*/
	public String getItem_icons() {
		return item_icons;
	}
	public void setItem_icons(String item_icons) {
		this.item_icons = item_icons;
	}
	public String getItem_pictures1() {
		return item_pictures1;
	}
	public void setItem_pictures1(String item_pictures1) {
		this.item_pictures1 = item_pictures1;
	}
	public String getItem_pictures2() {
		return item_pictures2;
	}
	public void setItem_pictures2(String item_pictures2) {
		this.item_pictures2 = item_pictures2;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getItemIconRef() {
		return itemIconRef;
	}
	public void setItemIconRef(String itemIconRef) {
		this.itemIconRef = itemIconRef;
	}
	public String getItemPicture1Ref() {
		return itemPicture1Ref;
	}
	public void setItemPicture1Ref(String itemPicture1Ref) {
		this.itemPicture1Ref = itemPicture1Ref;
	}
	public String getItemPicture2Ref() {
		return itemPicture2Ref;
	}
	public void setItemPicture2Ref(String itemPicture2Ref) {
		this.itemPicture2Ref = itemPicture2Ref;
	}
	public boolean isItemIconFlag() {
		return itemIconFlag;
	}
	public void setItemIconFlag(boolean itemIconFlag) {
		this.itemIconFlag = itemIconFlag;
	}
	public boolean isItemPicture1Flag() {
		return itemPicture1Flag;
	}
	public void setItemPicture1Flag(boolean itemPicture1Flag) {
		this.itemPicture1Flag = itemPicture1Flag;
	}
	public boolean isItemPicture2Flag() {
		return itemPicture2Flag;
	}
	public void setItemPicture2Flag(boolean itemPicture2Flag) {
		this.itemPicture2Flag = itemPicture2Flag;
	}
	/*public String getMenu_item_id() {
		return menu_item_id;
	}
	public void setMenu_item_id(String menu_item_id) {
		this.menu_item_id = menu_item_id;
	}*/
	public boolean isDeleteImageIcon() {
		return deleteImageIcon;
	}
	public int getMenu_item_id() {
		return menu_item_id;
	}
	public void setMenu_item_id(int menu_item_id) {
		this.menu_item_id = menu_item_id;
	}
	public void setDeleteImageIcon(boolean deleteImageIcon) {
		this.deleteImageIcon = deleteImageIcon;
	}
	public boolean isDeletePic1() {
		return deletePic1;
	}
	public void setDeletePic1(boolean deletePic1) {
		this.deletePic1 = deletePic1;
	}
	public boolean isDeletePic2() {
		return deletePic2;
	}
	public void setDeletePic2(boolean deletePic2) {
		this.deletePic2 = deletePic2;
	}
	
	
	
}
