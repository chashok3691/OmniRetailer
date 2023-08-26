package com.technolabssoftware.www;

public class WarehouseConfigurationsProxy implements com.technolabssoftware.www.WarehouseConfigurations {
  private String _endpoint = null;
  private com.technolabssoftware.www.WarehouseConfigurations warehouseConfigurations = null;
  
  public WarehouseConfigurationsProxy() {
    _initWarehouseConfigurationsProxy();
  }
  
  public WarehouseConfigurationsProxy(String endpoint) {
    _endpoint = endpoint;
    _initWarehouseConfigurationsProxy();
  }
  
  private void _initWarehouseConfigurationsProxy() {
    try {
      warehouseConfigurations = (new com.technolabssoftware.www.WarehouseconfigurationLocator()).getWarehouseConfigurationsImplPort();
      if (warehouseConfigurations != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)warehouseConfigurations)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)warehouseConfigurations)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (warehouseConfigurations != null)
      ((javax.xml.rpc.Stub)warehouseConfigurations)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WarehouseConfigurations getWarehouseConfigurations() {
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations;
  }
  
  public java.lang.String updateWarehouseStorageSystems(java.lang.String storageSystemsDetails) throws java.rmi.RemoteException{
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations.updateWarehouseStorageSystems(storageSystemsDetails);
  }
  
  public java.lang.String getWarehouseDetails(java.lang.String warehouseDetails) throws java.rmi.RemoteException{
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations.getWarehouseDetails(warehouseDetails);
  }
  
  public java.lang.String deleteWarehouses(java.lang.String warehouseDetails) throws java.rmi.RemoteException{
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations.deleteWarehouses(warehouseDetails);
  }
  
  public java.lang.String getWarehouses(java.lang.String warehouseDetails) throws java.rmi.RemoteException{
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations.getWarehouses(warehouseDetails);
  }
  
  public java.lang.String createWarehouse(java.lang.String warehouseDetails) throws java.rmi.RemoteException{
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations.createWarehouse(warehouseDetails);
  }
  
  public java.lang.String updateWarehouse(java.lang.String warehouseDetails) throws java.rmi.RemoteException{
    if (warehouseConfigurations == null)
      _initWarehouseConfigurationsProxy();
    return warehouseConfigurations.updateWarehouse(warehouseDetails);
  }
  
  
}