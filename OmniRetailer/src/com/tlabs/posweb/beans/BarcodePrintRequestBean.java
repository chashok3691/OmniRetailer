package com.tlabs.posweb.beans;

import java.util.List;

public class BarcodePrintRequestBean {

//	private List<GetSkuDetails> skuDeatils;
	private  RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String skuId;
	private String pluCode;
	private float mrp;
	private float salePrice;
	private String eanCode;
	private String measureRange;
	private String uomLabel;
	private int printCount;
	private String itemName;
	private List<BarcodePrintRequestBean> skuDetails;
	private String barcodeLabelPrintUrl;
	

	
	public String getBarcodeLabelPrintUrl() {
		return barcodeLabelPrintUrl;
	}
	public void setBarcodeLabelPrintUrl(String barcodeLabelPrintUrl) {
		this.barcodeLabelPrintUrl = barcodeLabelPrintUrl;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public int getPrintCount() {
		return printCount;
	}
	public void setPrintCount(int printCount) {
		this.printCount = printCount;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public float getMrp() {
		return mrp;
	}
	public void setMrp(float mrp) {
		this.mrp = mrp;
	}
	public float getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}
	public String getEanCode() {
		return eanCode;
	}
	public void setEanCode(String eanCode) {
		this.eanCode = eanCode;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public String getUomLabel() {
		return uomLabel;
	}
	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
	}
	public List<BarcodePrintRequestBean> getSkuDetails() {
		return skuDetails;
	}
	public void setSkuDetails(List<BarcodePrintRequestBean> skuDetails) {
		this.skuDetails = skuDetails;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	
	
	
	
	
	
	
}
