package com.technolabssoftware.www;

public class StoreTaxationServiceProxy implements com.technolabssoftware.www.StoreTaxationService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.StoreTaxationService_PortType storeTaxationService_PortType = null;
  
  public StoreTaxationServiceProxy() {
    _initStoreTaxationServiceProxy();
  }
  
  public StoreTaxationServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initStoreTaxationServiceProxy();
  }
  
  private void _initStoreTaxationServiceProxy() {
    try {
      storeTaxationService_PortType = (new com.technolabssoftware.www.StoreTaxationService_ServiceLocator()).getStoreTaxationServiceImplPort();
      if (storeTaxationService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)storeTaxationService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)storeTaxationService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (storeTaxationService_PortType != null)
      ((javax.xml.rpc.Stub)storeTaxationService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StoreTaxationService_PortType getStoreTaxationService_PortType() {
    if (storeTaxationService_PortType == null)
      _initStoreTaxationServiceProxy();
    return storeTaxationService_PortType;
  }
  
  public java.lang.String getStoreTaxation(java.lang.String getStoreTaxationStr) throws java.rmi.RemoteException{
    if (storeTaxationService_PortType == null)
      _initStoreTaxationServiceProxy();
    return storeTaxationService_PortType.getStoreTaxation(getStoreTaxationStr);
  }
  
  public java.lang.String createStoreTaxation(java.lang.String createStoreTaxationStr) throws java.rmi.RemoteException{
    if (storeTaxationService_PortType == null)
      _initStoreTaxationServiceProxy();
    return storeTaxationService_PortType.createStoreTaxation(createStoreTaxationStr);
  }
  
  public java.lang.String updateStoreTaxation(java.lang.String updateStoreTaxationStr) throws java.rmi.RemoteException{
    if (storeTaxationService_PortType == null)
      _initStoreTaxationServiceProxy();
    return storeTaxationService_PortType.updateStoreTaxation(updateStoreTaxationStr);
  }
  
  
}