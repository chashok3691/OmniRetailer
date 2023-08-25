package com.technolabssoftware.www;

public class OutletConfigurationsProxy implements com.technolabssoftware.www.OutletConfigurations {
  private String _endpoint = null;
  private com.technolabssoftware.www.OutletConfigurations outletConfigurations = null;
  
  public OutletConfigurationsProxy() {
    _initOutletConfigurationsProxy();
  }
  
  public OutletConfigurationsProxy(String endpoint) {
    _endpoint = endpoint;
    _initOutletConfigurationsProxy();
  }
  
  private void _initOutletConfigurationsProxy() {
    try {
      outletConfigurations = (new com.technolabssoftware.www.OutletConfigurationLocator()).getOutletConfigurationsImplPort();
      if (outletConfigurations != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)outletConfigurations)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)outletConfigurations)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (outletConfigurations != null)
      ((javax.xml.rpc.Stub)outletConfigurations)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.OutletConfigurations getOutletConfigurations() {
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations;
  }
  
  public java.lang.String getOutletStorageSystemDetails(java.lang.String storageSystems) throws java.rmi.RemoteException{
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations.getOutletStorageSystemDetails(storageSystems);
  }
  
  public java.lang.String createOutletStorageSystems(java.lang.String storageSystems) throws java.rmi.RemoteException{
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations.createOutletStorageSystems(storageSystems);
  }
  
  public java.lang.String updateStorageSystemDetails(java.lang.String storageSystems) throws java.rmi.RemoteException{
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations.updateStorageSystemDetails(storageSystems);
  }
  
  public java.lang.String deleteOutletStorageSystem(java.lang.String storageSystems) throws java.rmi.RemoteException{
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations.deleteOutletStorageSystem(storageSystems);
  }
  
  public java.lang.String updateOutletStorageSystems(java.lang.String storageSystems) throws java.rmi.RemoteException{
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations.updateOutletStorageSystems(storageSystems);
  }
  
  public java.lang.String getOutletStorageSystems(java.lang.String storageSystems) throws java.rmi.RemoteException{
    if (outletConfigurations == null)
      _initOutletConfigurationsProxy();
    return outletConfigurations.getOutletStorageSystems(storageSystems);
  }
  
  
}