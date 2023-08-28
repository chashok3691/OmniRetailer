package com.technolabssoftware.www;

public class SalesProxy implements com.technolabssoftware.www.Sales {
  private String _endpoint = null;
  private com.technolabssoftware.www.Sales sales = null;
  
  public SalesProxy() {
    _initSalesProxy();
  }
  
  public SalesProxy(String endpoint) {
    _endpoint = endpoint;
    _initSalesProxy();
  }
  
  private void _initSalesProxy() {
    try {
      sales = (new com.technolabssoftware.www.SalesServiceLocator()).getSalesImplPort();
      if (sales != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)sales)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)sales)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (sales != null)
      ((javax.xml.rpc.Stub)sales)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Sales getSales() {
    if (sales == null)
      _initSalesProxy();
    return sales;
  }
  
  public java.lang.String updateBilling(java.lang.String bill_details) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.updateBilling(bill_details);
  }
  
  public java.lang.String getBillsDetails(java.lang.String billDetails) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getBillsDetails(billDetails);
  }
  
  public java.lang.String exchangingItem(java.lang.String exchanging_item_details) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.exchangingItem(exchanging_item_details);
  }
  
  public java.lang.String getPendingBillsByPage(java.lang.String filterInfo) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getPendingBillsByPage(filterInfo);
  }
  
  public java.lang.String getSalesReport(java.lang.String reportByDate) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getSalesReport(reportByDate);
  }
  
  public java.lang.String getExistedSaleID(java.lang.String saleID) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getExistedSaleID(saleID);
  }
  
  public java.lang.String getStockDetailsByStockType(java.lang.String stockType) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getStockDetailsByStockType(stockType);
  }
  
  public java.lang.String searchSalesReportWithPagination(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.searchSalesReportWithPagination(searchCriteria);
  }
  
  public java.lang.String getHomeDeliveryBills(java.lang.String billDetails) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getHomeDeliveryBills(billDetails);
  }
  
  public java.lang.String searchStockWithPagination(java.lang.String stockSearchInput) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.searchStockWithPagination(stockSearchInput);
  }
  
  public java.lang.String getProcurementReport(java.lang.String report) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getProcurementReport(report);
  }
  
  public java.lang.String getXZreportDetails(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getXZreportDetails(searchCriteria);
  }
  
  public java.lang.String getSalesReports(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getSalesReports(searchCriteria);
  }
  
  public java.lang.String returningItem(java.lang.String returning_item_details) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.returningItem(returning_item_details);
  }
  
  public java.lang.String getXZreports(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getXZreports(searchCriteria);
  }
  
  public java.lang.String getHourWiseReport(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getHourWiseReport(searchCriteria);
  }
  
  public java.lang.String getBills(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getBills(searchCriteria);
  }
  
  public java.lang.String getAvailableStock(java.lang.String requestHeader) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getAvailableStock(requestHeader);
  }
  
  public java.lang.String getBillingDetails(java.lang.String saleID) throws java.rmi.RemoteException{
    if (sales == null)
      _initSalesProxy();
    return sales.getBillingDetails(saleID);
  }
  
  
}