package com.tlabs.posweb.beans;

public class NewArrivalProductsList {
	private Integer serNo;
	
	private String refId;
	
	private String skuId;
	
	private String skuDesc;
	
	private String productSpec;
	
	private String uom;
	
	private String uomLabel;
	
	private String image;
	
	private String newArrivalImageRefId;
	private boolean newArrivalImageFlag;
	

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNewArrivalImageRefId() {
		return newArrivalImageRefId;
	}

	public void setNewArrivalImageRefId(String newArrivalImageRefId) {
		this.newArrivalImageRefId = newArrivalImageRefId;
	}

	public boolean isNewArrivalImageFlag() {
		return newArrivalImageFlag;
	}

	public void setNewArrivalImageFlag(boolean newArrivalImageFlag) {
		this.newArrivalImageFlag = newArrivalImageFlag;
	}

	public Integer getSerNo() {
		return serNo;
	}

	public void setSerNo(Integer serNo) {
		this.serNo = serNo;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getSkuDesc() {
		return skuDesc;
	}

	public void setSkuDesc(String skuDesc) {
		this.skuDesc = skuDesc;
	}

	public String getProductSpec() {
		return productSpec;
	}

	public void setProductSpec(String productSpec) {
		this.productSpec = productSpec;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getUomLabel() {
		return uomLabel;
	}

	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
	}

}
