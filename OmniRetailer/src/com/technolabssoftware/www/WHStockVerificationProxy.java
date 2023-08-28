package com.technolabssoftware.www;

public class WHStockVerificationProxy implements com.technolabssoftware.www.WHStockVerification_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHStockVerification_PortType wHStockVerification_PortType = null;
  
  public WHStockVerificationProxy() {
    _initWHStockVerificationProxy();
  }
  
  public WHStockVerificationProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHStockVerificationProxy();
  }
  
  private void _initWHStockVerificationProxy() {
    try {
      wHStockVerification_PortType = (new com.technolabssoftware.www.WHStockVerification_ServiceLocator()).getWarehouseStockVerificationImplPort();
      if (wHStockVerification_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHStockVerification_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHStockVerification_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHStockVerification_PortType != null)
      ((javax.xml.rpc.Stub)wHStockVerification_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHStockVerification_PortType getWHStockVerification_PortType() {
    if (wHStockVerification_PortType == null)
      _initWHStockVerificationProxy();
    return wHStockVerification_PortType;
  }
  
  public java.lang.String getStockVerificationDetails(java.lang.String getStockVerificationDetailsRequest) throws java.rmi.RemoteException{
    if (wHStockVerification_PortType == null)
      _initWHStockVerificationProxy();
    return wHStockVerification_PortType.getStockVerificationDetails(getStockVerificationDetailsRequest);
  }
  
  public java.lang.String getSkuDetails(java.lang.String productId) throws java.rmi.RemoteException{
    if (wHStockVerification_PortType == null)
      _initWHStockVerificationProxy();
    return wHStockVerification_PortType.getSkuDetails(productId);
  }
  
  public java.lang.String updateStock(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException{
    if (wHStockVerification_PortType == null)
      _initWHStockVerificationProxy();
    return wHStockVerification_PortType.updateStock(stockVerificationDetails);
  }
  
  public java.lang.String getStockVerification(java.lang.String getStockVerificationRequest) throws java.rmi.RemoteException{
    if (wHStockVerification_PortType == null)
      _initWHStockVerificationProxy();
    return wHStockVerification_PortType.getStockVerification(getStockVerificationRequest);
  }
  
  
}