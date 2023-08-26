package com.technolabssoftware.www;

public class InventoryServicesProxy implements com.technolabssoftware.www.InventoryServices {
  private String _endpoint = null;
  private com.technolabssoftware.www.InventoryServices inventoryServices = null;
  
  public InventoryServicesProxy() {
    _initInventoryServicesProxy();
  }
  
  public InventoryServicesProxy(String endpoint) {
    _endpoint = endpoint;
    _initInventoryServicesProxy();
  }
  
  private void _initInventoryServicesProxy() {
    try {
      inventoryServices = (new com.technolabssoftware.www.InventoryServiceLocator()).getInventoryServicesImplPort();
      if (inventoryServices != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)inventoryServices)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)inventoryServices)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (inventoryServices != null)
      ((javax.xml.rpc.Stub)inventoryServices)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.InventoryServices getInventoryServices() {
    if (inventoryServices == null)
      _initInventoryServicesProxy();
    return inventoryServices;
  }
  
  public java.lang.String getAverageInventory(java.lang.String inventory) throws java.rmi.RemoteException{
    if (inventoryServices == null)
      _initInventoryServicesProxy();
    return inventoryServices.getAverageInventory(inventory);
  }
  
  
}