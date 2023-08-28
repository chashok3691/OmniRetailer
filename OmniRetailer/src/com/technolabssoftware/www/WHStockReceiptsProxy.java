package com.technolabssoftware.www;

public class WHStockReceiptsProxy implements com.technolabssoftware.www.WHStockReceipts {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHStockReceipts wHStockReceipts = null;
  
  public WHStockReceiptsProxy() {
    _initWHStockReceiptsProxy();
  }
  
  public WHStockReceiptsProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHStockReceiptsProxy();
  }
  
  private void _initWHStockReceiptsProxy() {
    try {
      wHStockReceipts = (new com.technolabssoftware.www.WHStockReceiptServicesLocator()).getWHStockReceiptsImplPort();
      if (wHStockReceipts != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHStockReceipts)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHStockReceipts)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHStockReceipts != null)
      ((javax.xml.rpc.Stub)wHStockReceipts)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHStockReceipts getWHStockReceipts() {
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts;
  }
  
  public java.lang.String createNewStockProcurementReceipt(java.lang.String procurement_details) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.createNewStockProcurementReceipt(procurement_details);
  }
  
  public java.lang.String getStockReceiptIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.getStockReceiptIds(searchCriteria);
  }
  
  public java.lang.String getStockProcurementReceipt(java.lang.String receiptId) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.getStockProcurementReceipt(receiptId);
  }
  
  public java.lang.String getStockProcurementReceipts(java.lang.String start) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.getStockProcurementReceipts(start);
  }
  
  public java.lang.String updateStockReciept(java.lang.String stockRecieptDetails) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.updateStockReciept(stockRecieptDetails);
  }
  
  public java.lang.String getStockReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.getStockReceipts(searchCriteria);
  }
  
  public java.lang.String createStockReciept(java.lang.String stockRecieptDetails) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.createStockReciept(stockRecieptDetails);
  }
  
  public java.lang.String getStockProcurementReceiptIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.getStockProcurementReceiptIds(searchCriteria);
  }
  
  public java.lang.String getStockReceipt(java.lang.String receiptID) throws java.rmi.RemoteException{
    if (wHStockReceipts == null)
      _initWHStockReceiptsProxy();
    return wHStockReceipts.getStockReceipt(receiptID);
  }
  
  
}