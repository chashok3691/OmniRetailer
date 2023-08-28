package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author karthik.k
 *
 */
public class WarehouseReport {
	private String skuID;
	private String skuId;
	private String startDate;
	private String endDate;
	private String itemDescription;
	private String supplierId;
	private String supplierName;
	private BigDecimal price;
	private BigDecimal cost;
	private BigDecimal qty;
	private String uom;
	private String phoneNum;
	private String plucode;
	private String itemDesc;
	private BigDecimal procQty;
	private List<BigDecimal> priceList;
	private List<BigDecimal> qtyList;
	private BigDecimal procCost;
	private BigDecimal conQty;
	private float quantity;
	private BigDecimal conCost;
	private BigDecimal procPrice;
	private float grnQty;
	private float grnValue;
	private float availQty;
	private String brandName;
	private BigDecimal pricDiff;
	private String store_location;
	private String categoryName;
	private BigDecimal pricVariance;
	private String location;
	private String searchCriteriaStr;
	private String category;
	private String billRef;
	private String serialBillId;
	private String creditNoteRef;
	private String customerMobileNo;
	private String customerName;
	private String creditNoteReason;
	private String billAmount;
	private String productId;
	private String productDesc;
	private String subCategory;
	private String statusFlag;
	private String department;
	private BigDecimal totalCost;
	private String hsnCode;
	private BigDecimal tax;
	private String taxCode;
	private String taxRate;
	private BigDecimal taxValue;
	private float cardTotal;
	private float cashTotal;
	private float vouchersTotal;
	private float couponsTotal;
	private float creditsAmt;
	private float sodexTotal;
	private float ticketTotal;
	private float creditTotal;
	private String cgstTaxRate ;
	private float cgstTaxValue ;
	private String sgstTaxRate ;
	private float sgstTaxValue ;
	private String igstTaxRate ;
	private float igstTaxValue ;
	private float dueAmount;
	private float receivedAmt;
	private String otherTaxRate ;
	private float otherTaxValue ;
	private BigDecimal breakEvenQty;
	private BigDecimal breakEvenValue;
	private BigDecimal poQty;
	private BigDecimal poValue;
	private String invoiceRef;
	private String noteRef;
	private String grnDateStr;
	private String poRef;
	private BigDecimal shipmentPer;
	private BigDecimal salePriceWithoutTax;
	private BigDecimal saleTaxValue;
	private String poDatestr;
	private BigDecimal discount;
	private BigDecimal catContr;
	private BigDecimal storeContr;
	private BigDecimal lossQty;
	private BigDecimal lossValue;
	private BigDecimal lossPer;
	private String periodicType;
	private Double catContVal;
    private Double storeContVal;
    private String eventId;
    private boolean hourWiseReport;
    private String updatedDate;
    private String redeemBillId;
    
    
    
    
    
    public String getRedeemBillId() {
		return redeemBillId;
	}

	public void setRedeemBillId(String redeemBillId) {
		this.redeemBillId = redeemBillId;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public boolean isHourWiseReport() {
		return hourWiseReport;
	}

	public void setHourWiseReport(boolean hourWiseReport) {
		this.hourWiseReport = hourWiseReport;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	
  //  private boolean isSaveReport;

    private String redeemedBillRef;
    private String originalBillId;
    private String counterId;
    private String itemName;
    private String itemTax;
    private float totalTaxAmount;
    
    private float inputTax;
    private float outputTax;
    private float taxDifference;
    private float supplyQuantity;
    
    
    private Double creditNoteAvailableAmount;
	private Double creditNoteRedeemAmount;
	private String serialBillRef;
	private String editReason;
	
	private String serailBillIdYearly;

	///added for DSR type report 
		private float totalPrice;
	    private float totalPrice_yesterday;
	    private int  totalBillsCount;
	    private int  totalBillsCount_yesterday;
	    private float cat_foodTotal;
	    private float cat_nonFoodTotal;
	    private float cat_gm;
	    private float cat_staples;
	    private float cat_othersTotal;
	    private float cat_foodTotal_yesterday;
	    private float cat_nonFoodTotal_yesterday;
	    private float cat_gm_yesterday;
	    private float cat_staples_yesterday;
	    private float cat_othersTotal_yesterday;
	    private float brand_oilTotal;
	    private float brand_riceTotal;
	    private float brand_beveragesTotal;
	    private float brand_ayustarTotal;
	    private float brand_othersTotal;
	    private float brand_oilTotal_yesterday;
	    private float brand_riceTotal_yesterday;
	    private float brand_beveragesTotal_yesterday;
	    private float brand_ayustarTotal_yesterday;
	    private float brand_othersTotal_yesterday;
	    private float brand_sfd;
	    private float brand_sfd_yesterday;
	
	    
	    
	    
    public String getOriginalBillId() {
			return originalBillId;
		}

		public void setOriginalBillId(String originalBillId) {
			this.originalBillId = originalBillId;
		}

	public float getTotalPrice() {
			return totalPrice;
		}

		public void setTotalPrice(float totalPrice) {
			this.totalPrice = totalPrice;
		}

		public float getTotalPrice_yesterday() {
			return totalPrice_yesterday;
		}

		public void setTotalPrice_yesterday(float totalPrice_yesterday) {
			this.totalPrice_yesterday = totalPrice_yesterday;
		}

		public int getTotalBillsCount() {
			return totalBillsCount;
		}

		public void setTotalBillsCount(int totalBillsCount) {
			this.totalBillsCount = totalBillsCount;
		}

		public int getTotalBillsCount_yesterday() {
			return totalBillsCount_yesterday;
		}

		public void setTotalBillsCount_yesterday(int totalBillsCount_yesterday) {
			this.totalBillsCount_yesterday = totalBillsCount_yesterday;
		}

		public float getCat_foodTotal() {
			return cat_foodTotal;
		}

		public void setCat_foodTotal(float cat_foodTotal) {
			this.cat_foodTotal = cat_foodTotal;
		}

		public float getCat_nonFoodTotal() {
			return cat_nonFoodTotal;
		}

		public void setCat_nonFoodTotal(float cat_nonFoodTotal) {
			this.cat_nonFoodTotal = cat_nonFoodTotal;
		}

		public float getCat_gm() {
			return cat_gm;
		}

		public void setCat_gm(float cat_gm) {
			this.cat_gm = cat_gm;
		}

		public float getCat_staples() {
			return cat_staples;
		}

		public void setCat_staples(float cat_staples) {
			this.cat_staples = cat_staples;
		}

		public float getCat_othersTotal() {
			return cat_othersTotal;
		}

		public void setCat_othersTotal(float cat_othersTotal) {
			this.cat_othersTotal = cat_othersTotal;
		}

		public float getCat_foodTotal_yesterday() {
			return cat_foodTotal_yesterday;
		}

		public void setCat_foodTotal_yesterday(float cat_foodTotal_yesterday) {
			this.cat_foodTotal_yesterday = cat_foodTotal_yesterday;
		}

		public float getCat_nonFoodTotal_yesterday() {
			return cat_nonFoodTotal_yesterday;
		}

		public void setCat_nonFoodTotal_yesterday(float cat_nonFoodTotal_yesterday) {
			this.cat_nonFoodTotal_yesterday = cat_nonFoodTotal_yesterday;
		}

		public float getCat_gm_yesterday() {
			return cat_gm_yesterday;
		}

		public void setCat_gm_yesterday(float cat_gm_yesterday) {
			this.cat_gm_yesterday = cat_gm_yesterday;
		}

		public float getCat_staples_yesterday() {
			return cat_staples_yesterday;
		}

		public void setCat_staples_yesterday(float cat_staples_yesterday) {
			this.cat_staples_yesterday = cat_staples_yesterday;
		}

		public float getCat_othersTotal_yesterday() {
			return cat_othersTotal_yesterday;
		}

		public void setCat_othersTotal_yesterday(float cat_othersTotal_yesterday) {
			this.cat_othersTotal_yesterday = cat_othersTotal_yesterday;
		}

		public float getBrand_oilTotal() {
			return brand_oilTotal;
		}

		public void setBrand_oilTotal(float brand_oilTotal) {
			this.brand_oilTotal = brand_oilTotal;
		}

		public float getBrand_riceTotal() {
			return brand_riceTotal;
		}

		public void setBrand_riceTotal(float brand_riceTotal) {
			this.brand_riceTotal = brand_riceTotal;
		}

		public float getBrand_beveragesTotal() {
			return brand_beveragesTotal;
		}

		public void setBrand_beveragesTotal(float brand_beveragesTotal) {
			this.brand_beveragesTotal = brand_beveragesTotal;
		}

		public float getBrand_ayustarTotal() {
			return brand_ayustarTotal;
		}

		public void setBrand_ayustarTotal(float brand_ayustarTotal) {
			this.brand_ayustarTotal = brand_ayustarTotal;
		}

		public float getBrand_othersTotal() {
			return brand_othersTotal;
		}

		public void setBrand_othersTotal(float brand_othersTotal) {
			this.brand_othersTotal = brand_othersTotal;
		}

		public float getBrand_oilTotal_yesterday() {
			return brand_oilTotal_yesterday;
		}

		public void setBrand_oilTotal_yesterday(float brand_oilTotal_yesterday) {
			this.brand_oilTotal_yesterday = brand_oilTotal_yesterday;
		}

		public float getBrand_riceTotal_yesterday() {
			return brand_riceTotal_yesterday;
		}

		public void setBrand_riceTotal_yesterday(float brand_riceTotal_yesterday) {
			this.brand_riceTotal_yesterday = brand_riceTotal_yesterday;
		}

		public float getBrand_beveragesTotal_yesterday() {
			return brand_beveragesTotal_yesterday;
		}

		public void setBrand_beveragesTotal_yesterday(float brand_beveragesTotal_yesterday) {
			this.brand_beveragesTotal_yesterday = brand_beveragesTotal_yesterday;
		}

		public float getBrand_ayustarTotal_yesterday() {
			return brand_ayustarTotal_yesterday;
		}

		public void setBrand_ayustarTotal_yesterday(float brand_ayustarTotal_yesterday) {
			this.brand_ayustarTotal_yesterday = brand_ayustarTotal_yesterday;
		}

		public float getBrand_othersTotal_yesterday() {
			return brand_othersTotal_yesterday;
		}

		public void setBrand_othersTotal_yesterday(float brand_othersTotal_yesterday) {
			this.brand_othersTotal_yesterday = brand_othersTotal_yesterday;
		}

		public float getBrand_sfd() {
			return brand_sfd;
		}

		public void setBrand_sfd(float brand_sfd) {
			this.brand_sfd = brand_sfd;
		}

		public float getBrand_sfd_yesterday() {
			return brand_sfd_yesterday;
		}

		public void setBrand_sfd_yesterday(float brand_sfd_yesterday) {
			this.brand_sfd_yesterday = brand_sfd_yesterday;
		}

	public String getSerailBillIdYearly() {
    		return serailBillIdYearly;
    	}
    	public void setSerailBillIdYearly(String serailBillIdYearly) {
    		this.serailBillIdYearly = serailBillIdYearly;
    	}
	
	
    
public String getEditReason() {
		return editReason;
	}

	public void setEditReason(String editReason) {
		this.editReason = editReason;
	}

public String getSerialBillId() {
		return serialBillId;
	}

	public void setSerialBillId(String serialBillId) {
		this.serialBillId = serialBillId;
	}

public Double getCreditNoteAvailableAmount() {
		return creditNoteAvailableAmount;
	}

	public void setCreditNoteAvailableAmount(Double creditNoteAvailableAmount) {
		this.creditNoteAvailableAmount = creditNoteAvailableAmount;
	}

	public Double getCreditNoteRedeemAmount() {
		return creditNoteRedeemAmount;
	}

	public void setCreditNoteRedeemAmount(Double creditNoteRedeemAmount) {
		this.creditNoteRedeemAmount = creditNoteRedeemAmount;
	}

	public String getSerialBillRef() {
		return serialBillRef;
	}

	public void setSerialBillRef(String serialBillRef) {
		this.serialBillRef = serialBillRef;
	}

public float getSupplyQuantity() {
		return supplyQuantity;
	}

	public void setSupplyQuantity(float supplyQuantity) {
		this.supplyQuantity = supplyQuantity;
	}

public float getInputTax() {
		return inputTax;
	}

	public void setInputTax(float inputTax) {
		this.inputTax = inputTax;
	}

	public float getOutputTax() {
		return outputTax;
	}

	public void setOutputTax(float outputTax) {
		this.outputTax = outputTax;
	}

	public float getTaxDifference() {
		return taxDifference;
	}

	public void setTaxDifference(float taxDifference) {
		this.taxDifference = taxDifference;
	}

public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemTax() {
		return itemTax;
	}

	public void setItemTax(String itemTax) {
		this.itemTax = itemTax;
	}

	public float getTotalTaxAmount() {
		return totalTaxAmount;
	}

	public void setTotalTaxAmount(float totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}

public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	//    private boolean isSaveReport;
	public String getRedeemedBillRef() {
		return redeemedBillRef;
	}

	public void setRedeemedBillRef(String redeemedBillRef) {
		this.redeemedBillRef = redeemedBillRef;
	}

	private String billId;
private String creditNoteNo;
    
    public String getBillId() {
	return billId;
}

public void setBillId(String billId) {
	this.billId = billId;
}

public String getCreditNoteNo() {
	return creditNoteNo;
}

public void setCreditNoteNo(String creditNoteNo) {
	this.creditNoteNo = creditNoteNo;
}

	private List<String> locationsList;
    
    public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	private List<String> eansList;
    
    public List<String> getEansList() {
		return eansList;
	}

	public void setEansList(List<String> eansList) {
		this.eansList = eansList;
	}

	private String noofBills;
	private String numberOfWalkins;
	private String walkInConversion;
    
	private Map<String,Object> dayWiseReport;
	
	public Map<String, Object> getDayWiseReport() {
		return dayWiseReport;
	}

	public void setDayWiseReport(Map<String, Object> dayWiseReport) {
		this.dayWiseReport = dayWiseReport;
	}

	public String getNoofBills() {
		return noofBills;
	}

	public void setNoofBills(String noofBills) {
		this.noofBills = noofBills;
	}

	public String getNumberOfWalkins() {
		return numberOfWalkins;
	}

	public void setNumberOfWalkins(String numberOfWalkins) {
		this.numberOfWalkins = numberOfWalkins;
	}

	public String getWalkInConversion() {
		return walkInConversion;
	}

	public void setWalkInConversion(String walkInConversion) {
		this.walkInConversion = walkInConversion;
	}

	public String getCgstTaxRate() {
		return cgstTaxRate;
	}

	public void setCgstTaxRate(String cgstTaxRate) {
		this.cgstTaxRate = cgstTaxRate;
	}

	public float getCgstTaxValue() {
		return cgstTaxValue;
	}

	public void setCgstTaxValue(float cgstTaxValue) {
		this.cgstTaxValue = cgstTaxValue;
	}

	public String getSgstTaxRate() {
		return sgstTaxRate;
	}

	public void setSgstTaxRate(String sgstTaxRate) {
		this.sgstTaxRate = sgstTaxRate;
	}

	public float getSgstTaxValue() {
		return sgstTaxValue;
	}

	public void setSgstTaxValue(float sgstTaxValue) {
		this.sgstTaxValue = sgstTaxValue;
	}

	public String getIgstTaxRate() {
		return igstTaxRate;
	}

	public void setIgstTaxRate(String igstTaxRate) {
		this.igstTaxRate = igstTaxRate;
	}

	public float getIgstTaxValue() {
		return igstTaxValue;
	}

	public void setIgstTaxValue(float igstTaxValue) {
		this.igstTaxValue = igstTaxValue;
	}

	public String getBillRef() {
		return billRef;
	}

	public void setBillRef(String billRef) {
		this.billRef = billRef;
	}

	public String getCreditNoteRef() {
		return creditNoteRef;
	}

	public void setCreditNoteRef(String creditNoteRef) {
		this.creditNoteRef = creditNoteRef;
	}

	public String getCustomerMobileNo() {
		return customerMobileNo;
	}

	public void setCustomerMobileNo(String customerMobileNo) {
		this.customerMobileNo = customerMobileNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCreditNoteReason() {
		return creditNoteReason;
	}

	public void setCreditNoteReason(String creditNoteReason) {
		this.creditNoteReason = creditNoteReason;
	}

	public String getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	private String subDepartment;
	
	private String model;
	
	private String brand;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private String searchCriteria;
	
	private String dateStr;
	private String section;
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private List<WarehouseReport> warehouseReportList;
	private List<WarehouseReport> suppliesReport;
	private List<WarehouseReport> reportsList;
	private String startIndex;
	private String userName;
	private Map<String,WarehouseReport> mapDet;
	

	private String maxRecords;
	
	private int totalRecords;
	private String ean;
	private String measureRange;
	private String productRange;
	private String color;
	private String size;
	private String style;
	private BigDecimal salePrice;
	private BigDecimal costPrice;
	private BigDecimal marginvalue;
	private BigDecimal marginPercentage;
	private BigDecimal costPriceWithTax;
	private BigDecimal shipmentcharges;
	private BigDecimal shipmentChargesperQty;
	private BigDecimal costPricewithDiscount;
//	private boolean saveReportFlag;
	private boolean isSaveReport;
	
	
	private BigDecimal cgst2_5;
	private BigDecimal sgst2_5;
	private BigDecimal cgst9;
	private BigDecimal sgst9;
	private BigDecimal cgst6;
	private BigDecimal sgst6;
	
	private BigDecimal cgst14;
	private BigDecimal sgst14;
	private String expiryDate;
	
	
	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public BigDecimal getCgst14() {
		return cgst14;
	}

	public void setCgst14(BigDecimal cgst14) {
		this.cgst14 = cgst14;
	}

	public BigDecimal getSgst14() {
		return sgst14;
	}

	public void setSgst14(BigDecimal sgst14) {
		this.sgst14 = sgst14;
	}

	public BigDecimal getCgst2_5() {
		return cgst2_5;
	}

	public void setCgst2_5(BigDecimal cgst2_5) {
		this.cgst2_5 = cgst2_5;
	}

	public BigDecimal getSgst2_5() {
		return sgst2_5;
	}

	public void setSgst2_5(BigDecimal sgst2_5) {
		this.sgst2_5 = sgst2_5;
	}

	public BigDecimal getCgst9() {
		return cgst9;
	}

	public void setCgst9(BigDecimal cgst9) {
		this.cgst9 = cgst9;
	}

	public BigDecimal getSgst9() {
		return sgst9;
	}

	public void setSgst9(BigDecimal sgst9) {
		this.sgst9 = sgst9;
	}

	public BigDecimal getCgst6() {
		return cgst6;
	}

	public void setCgst6(BigDecimal cgst6) {
		this.cgst6 = cgst6;
	}

	public BigDecimal getSgst6() {
		return sgst6;
	}

	public void setSgst6(BigDecimal sgst6) {
		this.sgst6 = sgst6;
	}

	private String date;
	private String cashierName;
	private String zone;
	private Float mrp;
	private BigDecimal editedprice;
	private String zoneId;

	private String requiredRecords;
	
	
	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getRequiredRecords() {
		return requiredRecords;
	}

	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}

	public BigDecimal getEditedprice() {
		return editedprice;
	}

	public void setEditedprice(BigDecimal editedprice) {
		this.editedprice = editedprice;
	}

	public Float getMrp() {
		return mrp;
	}

	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getCashierName() {
		return cashierName;
	}

	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}

	public String salesReportFilePath;
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSkuID() {
		return skuID;
	}

	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getPlucode() {
		return plucode;
	}

	public void setPlucode(String plucode) {
		this.plucode = plucode;
	}

	public BigDecimal getProcQty() {
		return procQty;
	}

	public void setProcQty(BigDecimal procQty) {
		this.procQty = procQty;
	}

	public BigDecimal getProcCost() {
		return procCost;
	}

	public void setProcCost(BigDecimal procCost) {
		this.procCost = procCost;
	}

	public BigDecimal getConQty() {
		return conQty;
	}

	public void setConQty(BigDecimal conQty) {
		this.conQty = conQty;
	}

	public BigDecimal getConCost() {
		return conCost;
	}

	public void setConCost(BigDecimal conCost) {
		this.conCost = conCost;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}


	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
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

	public List<WarehouseReport> getWarehouseReportList() {
		return warehouseReportList;
	}

	public void setWarehouseReportList(List<WarehouseReport> warehouseReportList) {
		this.warehouseReportList = warehouseReportList;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}



	public List<WarehouseReport> getSuppliesReport() {
		return suppliesReport;
	}

	public void setSuppliesReport(List<WarehouseReport> suppliesReport) {
		this.suppliesReport = suppliesReport;
	}

	public BigDecimal getQty() {
		return qty;
	}

	public void setQty(BigDecimal qty) {
		this.qty = qty;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public BigDecimal getProcPrice() {
		return procPrice;
	}

	public void setProcPrice(BigDecimal procPrice) {
		this.procPrice = procPrice;
	}

	public BigDecimal getPricDiff() {
		return pricDiff;
	}

	public void setPricDiff(BigDecimal pricDiff) {
		this.pricDiff = pricDiff;
	}

	public BigDecimal getPricVariance() {
		return pricVariance;
	}

	public void setPricVariance(BigDecimal pricVariance) {
		this.pricVariance = pricVariance;
	}

	public List<BigDecimal> getPriceList() {
		return priceList;
	}

	public void setPriceList(List<BigDecimal> priceList) {
		this.priceList = priceList;
	}

	public List<BigDecimal> getQtyList() {
		return qtyList;
	}

	public void setQtyList(List<BigDecimal> qtyList) {
		this.qtyList = qtyList;
	}

	public List<WarehouseReport> getReportsList() {
		return reportsList;
	}

	public void setReportsList(List<WarehouseReport> reportsList) {
		this.reportsList = reportsList;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public float getAvailQty() {
		return availQty;
	}

	public void setAvailQty(float availQty) {
		this.availQty = availQty;
	}

	public float getGrnQty() {
		return grnQty;
	}

	public void setGrnQty(float grnQty) {
		this.grnQty = grnQty;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public float getGrnValue() {
		return grnValue;
	}

	public void setGrnValue(float grnValue) {
		this.grnValue = grnValue;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getMarginvalue() {
		return marginvalue;
	}

	public void setMarginvalue(BigDecimal marginvalue) {
		this.marginvalue = marginvalue;
	}

	public BigDecimal getMarginPercentage() {
		return marginPercentage;
	}

	public void setMarginPercentage(BigDecimal marginPercentage) {
		this.marginPercentage = marginPercentage;
	}

	public BigDecimal getCostPriceWithTax() {
		return costPriceWithTax;
	}

	public void setCostPriceWithTax(BigDecimal costPriceWithTax) {
		this.costPriceWithTax = costPriceWithTax;
	}

	public BigDecimal getShipmentcharges() {
		return shipmentcharges;
	}

	public void setShipmentcharges(BigDecimal shipmentcharges) {
		this.shipmentcharges = shipmentcharges;
	}

	public BigDecimal getShipmentChargesperQty() {
		return shipmentChargesperQty;
	}

	public void setShipmentChargesperQty(BigDecimal shipmentChargesperQty) {
		this.shipmentChargesperQty = shipmentChargesperQty;
	}

	public BigDecimal getCostPricewithDiscount() {
		return costPricewithDiscount;
	}

	public void setCostPricewithDiscount(BigDecimal costPricewithDiscount) {
		this.costPricewithDiscount = costPricewithDiscount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSearchCriteriaStr() {
		return searchCriteriaStr;
	}

	public void setSearchCriteriaStr(String searchCriteriaStr) {
		this.searchCriteriaStr = searchCriteriaStr;
	}

	public String getStatusFlag() {
		return statusFlag;
	}

	public void setStatusFlag(String statusFlag) {
		this.statusFlag = statusFlag;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public BigDecimal getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigDecimal totalCost) {
		this.totalCost = totalCost;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}

	public BigDecimal getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(BigDecimal taxValue) {
		this.taxValue = taxValue;
	}

	public float getCardTotal() {
		return cardTotal;
	}

	public void setCardTotal(float cardTotal) {
		this.cardTotal = cardTotal;
	}

	public float getCashTotal() {
		return cashTotal;
	}

	public void setCashTotal(float cashTotal) {
		this.cashTotal = cashTotal;
	}

	public float getVouchersTotal() {
		return vouchersTotal;
	}

	public void setVouchersTotal(float vouchersTotal) {
		this.vouchersTotal = vouchersTotal;
	}

	public float getCouponsTotal() {
		return couponsTotal;
	}

	public void setCouponsTotal(float couponsTotal) {
		this.couponsTotal = couponsTotal;
	}

	public float getCreditsAmt() {
		return creditsAmt;
	}

	public void setCreditsAmt(float creditsAmt) {
		this.creditsAmt = creditsAmt;
	}

	public float getSodexTotal() {
		return sodexTotal;
	}

	public void setSodexTotal(float sodexTotal) {
		this.sodexTotal = sodexTotal;
	}

	public float getTicketTotal() {
		return ticketTotal;
	}

	public void setTicketTotal(float ticketTotal) {
		this.ticketTotal = ticketTotal;
	}

	public float getCreditTotal() {
		return creditTotal;
	}

	public void setCreditTotal(float creditTotal) {
		this.creditTotal = creditTotal;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public float getDueAmount() {
		return dueAmount;
	}

	public void setDueAmount(float dueAmount) {
		this.dueAmount = dueAmount;
	}

	public float getReceivedAmt() {
		return receivedAmt;
	}

	public void setReceivedAmt(float receivedAmt) {
		this.receivedAmt = receivedAmt;
	}

	public float getOtherTaxValue() {
		return otherTaxValue;
	}

	public void setOtherTaxValue(float otherTaxValue) {
		this.otherTaxValue = otherTaxValue;
	}

	public String getOtherTaxRate() {
		return otherTaxRate;
	}

	public void setOtherTaxRate(String otherTaxRate) {
		this.otherTaxRate = otherTaxRate;
	}

	public BigDecimal getBreakEvenQty() {
		return breakEvenQty;
	}

	public void setBreakEvenQty(BigDecimal breakEvenQty) {
		this.breakEvenQty = breakEvenQty;
	}

	public BigDecimal getBreakEvenValue() {
		return breakEvenValue;
	}

	public void setBreakEvenValue(BigDecimal breakEvenValue) {
		this.breakEvenValue = breakEvenValue;
	}

	public BigDecimal getPoQty() {
		return poQty;
	}

	public void setPoQty(BigDecimal poQty) {
		this.poQty = poQty;
	}

	public BigDecimal getPoValue() {
		return poValue;
	}

	public void setPoValue(BigDecimal poValue) {
		this.poValue = poValue;
	}

	public String getInvoiceRef() {
		return invoiceRef;
	}

	public void setInvoiceRef(String invoiceRef) {
		this.invoiceRef = invoiceRef;
	}

	public String getNoteRef() {
		return noteRef;
	}

	public void setNoteRef(String noteRef) {
		this.noteRef = noteRef;
	}

	public String getGrnDateStr() {
		return grnDateStr;
	}

	public void setGrnDateStr(String grnDateStr) {
		this.grnDateStr = grnDateStr;
	}

	public String getPoRef() {
		return poRef;
	}

	public void setPoRef(String poRef) {
		this.poRef = poRef;
	}

	public BigDecimal getShipmentPer() {
		return shipmentPer;
	}

	public void setShipmentPer(BigDecimal shipmentPer) {
		this.shipmentPer = shipmentPer;
	}

	public BigDecimal getSalePriceWithoutTax() {
		return salePriceWithoutTax;
	}

	public void setSalePriceWithoutTax(BigDecimal salePriceWithoutTax) {
		this.salePriceWithoutTax = salePriceWithoutTax;
	}

	public BigDecimal getSaleTaxValue() {
		return saleTaxValue;
	}

	public void setSaleTaxValue(BigDecimal saleTaxValue) {
		this.saleTaxValue = saleTaxValue;
	}

	public String getPoDatestr() {
		return poDatestr;
	}

	public void setPoDatestr(String poDatestr) {
		this.poDatestr = poDatestr;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getCatContr() {
		return catContr;
	}

	public void setCatContr(BigDecimal catContr) {
		this.catContr = catContr;
	}

	public BigDecimal getStoreContr() {
		return storeContr;
	}

	public void setStoreContr(BigDecimal storeContr) {
		this.storeContr = storeContr;
	}

	public BigDecimal getLossQty() {
		return lossQty;
	}

	public void setLossQty(BigDecimal lossQty) {
		this.lossQty = lossQty;
	}

	public BigDecimal getLossValue() {
		return lossValue;
	}

	public void setLossValue(BigDecimal lossValue) {
		this.lossValue = lossValue;
	}

	public BigDecimal getLossPer() {
		return lossPer;
	}

	public void setLossPer(BigDecimal lossPer) {
		this.lossPer = lossPer;
	}

	public Map<String,WarehouseReport> getMapDet() {
		return mapDet;
	}

	public void setMapDet(Map<String,WarehouseReport> mapDet) {
		this.mapDet = mapDet;
	}

	public String getPeriodicType() {
		return periodicType;
	}

	public void setPeriodicType(String periodicType) {
		this.periodicType = periodicType;
	}

	public Double getCatContVal() {
		return catContVal;
	}

	public void setCatContVal(Double catContVal) {
		this.catContVal = catContVal;
	}

	public Double getStoreContVal() {
		return storeContVal;
	}

	public void setStoreContVal(Double storeContVal) {
		this.storeContVal = storeContVal;
	}





}
