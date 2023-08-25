package com.technolabssoftware.www;

public class StockRequestsProxy implements com.technolabssoftware.www.StockRequests_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.StockRequests_PortType stockRequests_PortType = null;
  
  public StockRequestsProxy() {
    _initStockRequestsProxy();
  }
  
  public StockRequestsProxy(String endpoint) {
    _endpoint = endpoint;
    _initStockRequestsProxy();
  }
  
  private void _initStockRequestsProxy() {
    try {
      stockRequests_PortType = (new com.technolabssoftware.www.StockRequests_ServiceLocator()).getStockRequestsImplPort();
      if (stockRequests_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)stockRequests_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)stockRequests_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (stockRequests_PortType != null)
      ((javax.xml.rpc.Stub)stockRequests_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StockRequests_PortType getStockRequests_PortType() {
    if (stockRequests_PortType == null)
      _initStockRequestsProxy();
    return stockRequests_PortType;
  }
  
  public java.lang.String createStockRequest(java.lang.String stockRequestDetails) throws java.rmi.RemoteException{
    if (stockRequests_PortType == null)
      _initStockRequestsProxy();
    return stockRequests_PortType.createStockRequest(stockRequestDetails);
  }
  
  public java.lang.String updateStockRequest(java.lang.String stockRequestDetails) throws java.rmi.RemoteException{
    if (stockRequests_PortType == null)
      _initStockRequestsProxy();
    return stockRequests_PortType.updateStockRequest(stockRequestDetails);
  }
  
  public java.lang.String getStockRequests(java.lang.String stockRequestDetails) throws java.rmi.RemoteException{
    if (stockRequests_PortType == null)
      _initStockRequestsProxy();
    return stockRequests_PortType.getStockRequests(stockRequestDetails);
  }
  
  
}