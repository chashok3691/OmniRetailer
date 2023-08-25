package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ProcurementReceipt implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2476515165538962624L;
	private String invoiceRefNumber;
	 private Float totalGRNValue;
	private String supplier_id ;
	private String supplier_name ;
	private String supplier_state ;
	private String location ;
	private String delivered_by ;
	private String inspected_by ;
	private String shipment_note ;
	private String po_reference ;
	private String status ;
	private String date ;
	private String remarks ;
	private String receipt_total_qty ;
	private float gst;
	private boolean toBeClosePO = false;;
	private BigDecimal totalDiscount = new BigDecimal("0");
	private BigDecimal tax = new BigDecimal("0");
	private BigDecimal shipmentCharges = new BigDecimal("0");
	private String receipt_ref_num;
	private String goods_receipt_ref_num;
	private List<GoodsReceiptsItems> itemDetails;
	private List<GoodsReceiptsItems> items;
	
	private String expiryDateStr;
	
	private List<String> locationsList;
	
//	private boolean isSaveReport;

	private boolean saveGRNFlag;
	private BigDecimal mrp;
	private String gstin;
	
	
	private String store_location;
	private String verificationCode;
	
	private String docLink;
	private String url;
	
	private String docLinkId;
	private String dockLinkFileName;

	 private boolean qtyFlag;
	 
	 
	 
	
	

	
	
	
	
	
	

	
	
	public boolean isQtyFlag() {
		return qtyFlag;
	}

	public void setQtyFlag(boolean qtyFlag) {
		this.qtyFlag = qtyFlag;
	}

	public String getDockLinkFileName() {
		return dockLinkFileName;
	}

	public void setDockLinkFileName(String dockLinkFileName) {
		this.dockLinkFileName = dockLinkFileName;
	}

	public String getDocLink() {
		return docLink;
	}

	public void setDocLink(String docLink) {
		this.docLink = docLink;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDocLinkId() {
		return docLinkId;
	}

	public void setDocLinkId(String docLinkId) {
		this.docLinkId = docLinkId;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public String getSupplier_state() {
		return supplier_state;
	}

	public void setSupplier_state(String supplier_state) {
		this.supplier_state = supplier_state;
	}

	public String getGstin() {
		return gstin;
	}

	public void setGstin(String gstin) {
		this.gstin = gstin;
	}

	public BigDecimal getMrp() {
		return mrp;
	}

	public void setMrp(BigDecimal mrp) {
		this.mrp = mrp;
	}

	public boolean isSaveGRNFlag() {
		return saveGRNFlag;
	}

	public void setSaveGRNFlag(boolean saveGRNFlag) {
		this.saveGRNFlag = saveGRNFlag;
	}

	private String filePath;
	
	private String storageRef;
	
	
	
/*	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}*/

	public String getStorageRef() {
		return storageRef;
	}

	public void setStorageRef(String storageRef) {
		this.storageRef = storageRef;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	private String salesReportFilePath;
	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	private String bactchNum;
	public String getBactchNum() {
		return bactchNum;
	}

	public void setBactchNum(String bactchNum) {
		this.bactchNum = bactchNum;
	}

	private float grand_total;
	private float sub_total;
	private RequestHeader requestHeader;
	private String start;
	private String receiptId;
	private String result;
	private String totalRecords;
	private List<ProcurementReceipt> receiptDetails;
	private List<ProcurementReceipt> grnList;
	private ProcurementReceipt grnObj;
	private String operation;
	private String startIndex;
	private String searchCriteria;
	private BigDecimal subTotal;
	private String startDate;
	private String endDate;
	private String maxRecords;
	private boolean outletAll;
	private boolean warehouseAll;
	private List<String> nextWorkFlowStates;
	private List<String> nextActivities;
	private List<String> previousStates;
	private List<OutletGrnWorkflowLog> grnWorkFlowLogList;
	private int slNo;
	private Integer sno;
	private String poRef;
	private String supplier_Id;

	private String receiptNoteRef;

	private String skuId;

	private String uom;

	private String itemDesc;

	private String itemName;
	
	private Float orderPrice;

	private Float orderQty;

	private String model;
 
	private String pluCode;

	private Float totalCost;

	private Float itemTax;

	private String productRange;

	private String measurementRange;

	private String category;

	private String brand;

	private String handledBy;
	
	private Float supplyPrice;

	private Float suppliedQty;
	 private String receiptNoteId;
	 
	 private List<String> zonesList;

	private List<String> grnRefList;
	 
	 public List<String> getGrnRefList() {
		return grnRefList;
	}

	public void setGrnRefList(List<String> grnRefList) {
		this.grnRefList = grnRefList;
	}

	private String quotationRef;
	 private String approvedBy; 
	 
	 private String submittedBy; 
	 private String supplierId;
	 
	 private String deliveredBy;
	 private String inspectedBy;

	
	 private Date dueDate;

	 private String itemScanCode;
	 
	
	 
	 
	 public List<OutletGrnWorkflowLog> getGrnWorkFlowLogList() {
		return grnWorkFlowLogList;
	}

	public void setGrnWorkFlowLogList(List<OutletGrnWorkflowLog> grnWorkFlowLogList) {
		this.grnWorkFlowLogList = grnWorkFlowLogList;
	}

	public String getItemScanCode() {
		return itemScanCode;
	}

	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}

	private Date deliveredOn;

	
	 private String supplierName;

	 
	 private String receivedBy;
	 
	 private Integer vendorRating = 1;


	 private String zoneId;
	 
	

	 
	private Date createdDate;

	 private Date updatedDate;

	 private String userName;

	 private String roleName;

	 private String comments;
	 private String deleteditems;
	 private String dueDateStr;
	 private String deliveredOnStr;
	 private String createdDateStr;
	 private String updatedDateStr;
	 private ResponseHeader responseHeader;
	 private List<GoodsReceiptsItems> itemsList; 
	
	 private boolean itemsRequired;
	 
	 private Double orderedQty;
	 
	 
	 private Float otherTaxAmt;
	 
	 
	 private Float cgstAmt;
	 private Float igstAmt;
	 
	 
	 
	 
	 public Float getIgstAmt() {
		return igstAmt;
	}

	public void setIgstAmt(Float igstAmt) {
		this.igstAmt = igstAmt;
	}

	private Float sgstAmt;
	 
	 public Float getCgstAmt() {
		return cgstAmt;
	}

	public void setCgstAmt(Float cgstAmt) {
		this.cgstAmt = cgstAmt;
	}

	public Float getSgstAmt() {
		return sgstAmt;
	}

	public void setSgstAmt(Float sgstAmt) {
		this.sgstAmt = sgstAmt;
	}

	public Float getOtherTaxAmt() {
		return otherTaxAmt;
	}

	public void setOtherTaxAmt(Float otherTaxAmt) {
		this.otherTaxAmt = otherTaxAmt;
	}

	private List<Integer> itemDeletionList;
	 
	 private List<String> receiptIds;
	
	 
	 private Float startPrice;
	 private Float endPrice;
	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public boolean isOutletAll() {
		return outletAll;
	}

	public void setOutletAll(boolean outletAll) {
		this.outletAll = outletAll;
	}

	public boolean isWarehouseAll() {
		return warehouseAll;
	}

	public void setWarehouseAll(boolean warehouseAll) {
		this.warehouseAll = warehouseAll;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public List<ProcurementReceipt> getReceiptDetails() {
		return receiptDetails;
	}
	public void setReceiptDetails(List<ProcurementReceipt> receiptDetails) {
		this.receiptDetails = receiptDetails;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSupplier_id() {
		return supplier_id;
	}
	public void setSupplier_id(String supplier_id) {
		this.supplier_id = supplier_id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDelivered_by() {
		return delivered_by;
	}
	public void setDelivered_by(String delivered_by) {
		this.delivered_by = delivered_by;
	}
	public String getInspected_by() {
		return inspected_by;
	}
	public void setInspected_by(String inspected_by) {
		this.inspected_by = inspected_by;
	}
	public String getShipment_note() {
		return shipment_note;
	}
	public void setShipment_note(String shipment_note) {
		this.shipment_note = shipment_note;
	}
	public String getPo_reference() {
		return po_reference;
	}
	public void setPo_reference(String po_reference) {
		this.po_reference = po_reference;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getReceipt_total_qty() {
		return receipt_total_qty;
	}
	public void setReceipt_total_qty(String receipt_total_qty) {
		this.receipt_total_qty = receipt_total_qty;
	}
	public float getGst() {
		return gst;
	}
	public void setGst(float gst) {
		this.gst = gst;
	}
	
	public String getGoods_receipt_ref_num() {
		return goods_receipt_ref_num;
	}
	public void setGoods_receipt_ref_num(String goods_receipt_ref_num) {
		this.goods_receipt_ref_num = goods_receipt_ref_num;
	}
	public String getReceipt_ref_num() {
		return receipt_ref_num;
	}
	public void setReceipt_ref_num(String receipt_ref_num) {
		this.receipt_ref_num = receipt_ref_num;
	}
	public List<GoodsReceiptsItems> getItemDetails() {
		return itemDetails;
	}
	public void setItemDetails(List<GoodsReceiptsItems> itemDetails) {
		this.itemDetails = itemDetails;
	}
	public float getGrand_total() {
		return grand_total;
	}
	public void setGrand_total(float grand_total) {
		this.grand_total = grand_total;
	}
	public float getSub_total() {
		return sub_total;
	}
	public void setSub_total(float sub_total) {
		this.sub_total = sub_total;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getReceiptId() {
		return receiptId;
	}
	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}
	public List<GoodsReceiptsItems> getItems() {
		return items;
	}
	public void setItems(List<GoodsReceiptsItems> items) {
		this.items = items;
	}

	

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getSupplier_Id() {
		return supplier_Id;
	}

	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}

	public String getReceiptNoteRef() {
		return receiptNoteRef;
	}

	public void setReceiptNoteRef(String receiptNoteRef) {
		this.receiptNoteRef = receiptNoteRef;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Float getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(Float orderQty) {
		this.orderQty = orderQty;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public Float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(Float totalCost) {
		this.totalCost = totalCost;
	}

	public Float getItemTax() {
		return itemTax;
	}

	public void setItemTax(Float itemTax) {
		this.itemTax = itemTax;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getMeasurementRange() {
		return measurementRange;
	}

	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getHandledBy() {
		return handledBy;
	}

	public void setHandledBy(String handledBy) {
		this.handledBy = handledBy;
	}

	public Float getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(Float supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public Float getSuppliedQty() {
		return suppliedQty;
	}

	public void setSuppliedQty(Float suppliedQty) {
		this.suppliedQty = suppliedQty;
	}

	public List<ProcurementReceipt> getGrnList() {
		return grnList;
	}

	public void setGrnList(List<ProcurementReceipt> grnList) {
		this.grnList = grnList;
	}

	public ProcurementReceipt getGrnObj() {
		return grnObj;
	}

	public void setGrnObj(ProcurementReceipt grnObj) {
		this.grnObj = grnObj;
	}

	public String getPoRef() {
		return poRef;
	}

	public void setPoRef(String poRef) {
		this.poRef = poRef;
	}

	public String getReceiptNoteId() {
		return receiptNoteId;
	}

	public void setReceiptNoteId(String receiptNoteId) {
		this.receiptNoteId = receiptNoteId;
	}

	public List<String> getZonesList() {
		return zonesList;
	}

	public void setZonesList(List<String> zonesList) {
		this.zonesList = zonesList;
	}

	public String getQuotationRef() {
		return quotationRef;
	}

	public void setQuotationRef(String quotationRef) {
		this.quotationRef = quotationRef;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getSubmittedBy() {
		return submittedBy;
	}

	public void setSubmittedBy(String submittedBy) {
		this.submittedBy = submittedBy;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getDeliveredBy() {
		return deliveredBy;
	}

	public void setDeliveredBy(String deliveredBy) {
		this.deliveredBy = deliveredBy;
	}

	public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getDeliveredOn() {
		return deliveredOn;
	}

	public void setDeliveredOn(Date deliveredOn) {
		this.deliveredOn = deliveredOn;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getReceivedBy() {
		return receivedBy;
	}

	public void setReceivedBy(String receivedBy) {
		this.receivedBy = receivedBy;
	}

	public Integer getVendorRating() {
		return vendorRating;
	}

	public void setVendorRating(Integer vendorRating) {
		this.vendorRating = vendorRating;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getDueDateStr() {
		return dueDateStr;
	}

	public void setDueDateStr(String dueDateStr) {
		this.dueDateStr = dueDateStr;
	}

	public String getDeliveredOnStr() {
		return deliveredOnStr;
	}

	public void setDeliveredOnStr(String deliveredOnStr) {
		this.deliveredOnStr = deliveredOnStr;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	

	public boolean isItemsRequired() {
		return itemsRequired;
	}

	public void setItemsRequired(boolean itemsRequired) {
		this.itemsRequired = itemsRequired;
	}

	public Double getOrderedQty() {
		return orderedQty;
	}

	public void setOrderedQty(Double orderedQty) {
		this.orderedQty = orderedQty;
	}

	public List<Integer> getItemDeletionList() {
		return itemDeletionList;
	}

	public void setItemDeletionList(List<Integer> itemDeletionList) {
		this.itemDeletionList = itemDeletionList;
	}

	public List<String> getReceiptIds() {
		return receiptIds;
	}

	public void setReceiptIds(List<String> receiptIds) {
		this.receiptIds = receiptIds;
	}

	public Float getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(Float startPrice) {
		this.startPrice = startPrice;
	}

	public Float getEndPrice() {
		return endPrice;
	}

	public void setEndPrice(Float endPrice) {
		this.endPrice = endPrice;
	}

	public List<GoodsReceiptsItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<GoodsReceiptsItems> itemsList) {
		this.itemsList = itemsList;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	public String getDeleteditems() {
		return deleteditems;
	}

	public void setDeleteditems(String deleteditems) {
		this.deleteditems = deleteditems;
	}

	public String getInvoiceRefNumber() {
		return invoiceRefNumber;
	}

	public void setInvoiceRefNumber(String invoiceRefNumber) {
		this.invoiceRefNumber = invoiceRefNumber;
	}



	public BigDecimal getTotalDiscount() {
		return totalDiscount;
	}

	public void setTotalDiscount(BigDecimal totalDiscount) {
		this.totalDiscount = totalDiscount;
	}

	public BigDecimal getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(BigDecimal shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public Float getTotalGRNValue() {
		return totalGRNValue;
	}

	public void setTotalGRNValue(Float totalGRNValue) {
		this.totalGRNValue = totalGRNValue;
	}

	public BigDecimal getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}

	public boolean isToBeClosePO() {
		return toBeClosePO;
	}

	public void setToBeClosePO(boolean toBeClosePO) {
		this.toBeClosePO = toBeClosePO;
	}
	
	
	
}
