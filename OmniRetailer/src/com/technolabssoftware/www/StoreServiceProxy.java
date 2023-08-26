package com.technolabssoftware.www;

public class StoreServiceProxy implements com.technolabssoftware.www.StoreService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.StoreService_PortType storeService_PortType = null;
  
  public StoreServiceProxy() {
    _initStoreServiceProxy();
  }
  
  public StoreServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initStoreServiceProxy();
  }
  
  private void _initStoreServiceProxy() {
    try {
      storeService_PortType = (new com.technolabssoftware.www.StoreService_ServiceLocator()).getStoreServiceImplPort();
      if (storeService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)storeService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)storeService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (storeService_PortType != null)
      ((javax.xml.rpc.Stub)storeService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StoreService_PortType getStoreService_PortType() {
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType;
  }
  
  public java.lang.String createLayout(java.lang.String layoutDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.createLayout(layoutDetails);
  }
  
  public java.lang.String getAllLayoutTables(java.lang.String layoutDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.getAllLayoutTables(layoutDetails);
  }
  
  public java.lang.String getBillingCounters(java.lang.String counterdetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.getBillingCounters(counterdetails);
  }
  
  public java.lang.String editLayout(java.lang.String layoutDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.editLayout(layoutDetails);
  }
  
  public java.lang.String createOutletSettings(java.lang.String outletSettings) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.createOutletSettings(outletSettings);
  }
  
  public java.lang.String updateStore(java.lang.String layoutDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.updateStore(layoutDetails);
  }
  
  public java.lang.String getStores(java.lang.String layoutDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.getStores(layoutDetails);
  }
  
  public java.lang.String getLayout(java.lang.String layoutDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.getLayout(layoutDetails);
  }
  
  public java.lang.String createStore(java.lang.String storeDetails) throws java.rmi.RemoteException{
    if (storeService_PortType == null)
      _initStoreServiceProxy();
    return storeService_PortType.createStore(storeDetails);
  }
  
  
}