package com.technolabssoftware.www;

public class SupplierServiceProxy implements com.technolabssoftware.www.SupplierService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.SupplierService_PortType supplierService_PortType = null;
  
  public SupplierServiceProxy() {
    _initSupplierServiceProxy();
  }
  
  public SupplierServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initSupplierServiceProxy();
  }
  
  private void _initSupplierServiceProxy() {
    try {
      supplierService_PortType = (new com.technolabssoftware.www.SupplierService_ServiceLocator()).getSupplierServiceImplPort();
      if (supplierService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)supplierService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)supplierService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (supplierService_PortType != null)
      ((javax.xml.rpc.Stub)supplierService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.SupplierService_PortType getSupplierService_PortType() {
    if (supplierService_PortType == null)
      _initSupplierServiceProxy();
    return supplierService_PortType;
  }
  
  public java.lang.String getSuppliers(java.lang.String supplierDetails) throws java.rmi.RemoteException{
    if (supplierService_PortType == null)
      _initSupplierServiceProxy();
    return supplierService_PortType.getSuppliers(supplierDetails);
  }
  
  public java.lang.String updateSupplier(java.lang.String supplierDetails) throws java.rmi.RemoteException{
    if (supplierService_PortType == null)
      _initSupplierServiceProxy();
    return supplierService_PortType.updateSupplier(supplierDetails);
  }
  
  public java.lang.String createSupplier(java.lang.String supplierDetails) throws java.rmi.RemoteException{
    if (supplierService_PortType == null)
      _initSupplierServiceProxy();
    return supplierService_PortType.createSupplier(supplierDetails);
  }
  
  public java.lang.String deleteSupplier(java.lang.String supplierDetails) throws java.rmi.RemoteException{
    if (supplierService_PortType == null)
      _initSupplierServiceProxy();
    return supplierService_PortType.deleteSupplier(supplierDetails);
  }
  
  
}