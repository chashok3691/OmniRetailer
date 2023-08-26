package com.technolabssoftware.www;

public class StockReturnServiceProxy implements com.technolabssoftware.www.StockReturnService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.StockReturnService_PortType stockReturnService_PortType = null;
  
  public StockReturnServiceProxy() {
    _initStockReturnServiceProxy();
  }
  
  public StockReturnServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initStockReturnServiceProxy();
  }
  
  private void _initStockReturnServiceProxy() {
    try {
      stockReturnService_PortType = (new com.technolabssoftware.www.StockReturnService_ServiceLocator()).getStockReturnServiceImplPort();
      if (stockReturnService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)stockReturnService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)stockReturnService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (stockReturnService_PortType != null)
      ((javax.xml.rpc.Stub)stockReturnService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StockReturnService_PortType getStockReturnService_PortType() {
    if (stockReturnService_PortType == null)
      _initStockReturnServiceProxy();
    return stockReturnService_PortType;
  }
  
  public java.lang.String createStockReturn(java.lang.String createStock) throws java.rmi.RemoteException{
    if (stockReturnService_PortType == null)
      _initStockReturnServiceProxy();
    return stockReturnService_PortType.createStockReturn(createStock);
  }
  
  public java.lang.String updateStockReturn(java.lang.String updateStock) throws java.rmi.RemoteException{
    if (stockReturnService_PortType == null)
      _initStockReturnServiceProxy();
    return stockReturnService_PortType.updateStockReturn(updateStock);
  }
  
  public java.lang.String getStockReturn(java.lang.String getStock) throws java.rmi.RemoteException{
    if (stockReturnService_PortType == null)
      _initStockReturnServiceProxy();
    return stockReturnService_PortType.getStockReturn(getStock);
  }
  
  
}