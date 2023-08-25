package com.technolabssoftware.www;

public class StockReceiptsProxy implements com.technolabssoftware.www.StockReceipts {
  private String _endpoint = null;
  private com.technolabssoftware.www.StockReceipts stockReceipts = null;
  
  public StockReceiptsProxy() {
    _initStockReceiptsProxy();
  }
  
  public StockReceiptsProxy(String endpoint) {
    _endpoint = endpoint;
    _initStockReceiptsProxy();
  }
  
  private void _initStockReceiptsProxy() {
    try {
      stockReceipts = (new com.technolabssoftware.www.StockReceiptServiceLocator()).getStockReceiptsImplPort();
      if (stockReceipts != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)stockReceipts)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)stockReceipts)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (stockReceipts != null)
      ((javax.xml.rpc.Stub)stockReceipts)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StockReceipts getStockReceipts() {
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts;
  }
  
  public java.lang.String createNewStockProcurementReceipt(java.lang.String procurement_details) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.createNewStockProcurementReceipt(procurement_details);
  }
  
  public java.lang.String getStockReceiptIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.getStockReceiptIds(searchCriteria);
  }
  
  public java.lang.String getStockProcurementReceipts(java.lang.String start) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.getStockProcurementReceipts(start);
  }
  
  public java.lang.String updateStockReciept(java.lang.String stockRecieptDetails) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.updateStockReciept(stockRecieptDetails);
  }
  
  public java.lang.String searchStockProcurementReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.searchStockProcurementReceipts(searchCriteria);
  }
  
  public java.lang.String searchStockReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.searchStockReceipts(searchCriteria);
  }
  
  public java.lang.String getStockProcurementReceipt(java.lang.String receiptId) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.getStockProcurementReceipt(receiptId);
  }
  
  public java.lang.String getStockReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.getStockReceipts(searchCriteria);
  }
  
  public java.lang.String createStockReciept(java.lang.String stockRecieptDetails) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.createStockReciept(stockRecieptDetails);
  }
  
  public java.lang.String getStockProcurementReceiptIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.getStockProcurementReceiptIds(searchCriteria);
  }
  
  public java.lang.String getStockReceipt(java.lang.String receiptID) throws java.rmi.RemoteException{
    if (stockReceipts == null)
      _initStockReceiptsProxy();
    return stockReceipts.getStockReceipt(receiptID);
  }
  
  
}