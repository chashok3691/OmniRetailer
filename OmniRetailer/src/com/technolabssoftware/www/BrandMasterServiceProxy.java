package com.technolabssoftware.www;

public class BrandMasterServiceProxy implements com.technolabssoftware.www.BrandMasterService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.BrandMasterService_PortType brandMasterService_PortType = null;
  
  public BrandMasterServiceProxy() {
    _initBrandMasterServiceProxy();
  }
  
  public BrandMasterServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initBrandMasterServiceProxy();
  }
  
  private void _initBrandMasterServiceProxy() {
    try {
      brandMasterService_PortType = (new com.technolabssoftware.www.BrandMasterService_ServiceLocator()).getBrandMasterServiceImplPort();
      if (brandMasterService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)brandMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)brandMasterService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (brandMasterService_PortType != null)
      ((javax.xml.rpc.Stub)brandMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.BrandMasterService_PortType getBrandMasterService_PortType() {
    if (brandMasterService_PortType == null)
      _initBrandMasterServiceProxy();
    return brandMasterService_PortType;
  }
  
  public java.lang.String deleteBrand(java.lang.String delete) throws java.rmi.RemoteException{
    if (brandMasterService_PortType == null)
      _initBrandMasterServiceProxy();
    return brandMasterService_PortType.deleteBrand(delete);
  }
  
  public java.lang.String updateBrand(java.lang.String update) throws java.rmi.RemoteException{
    if (brandMasterService_PortType == null)
      _initBrandMasterServiceProxy();
    return brandMasterService_PortType.updateBrand(update);
  }
  
  public java.lang.String getBrand(java.lang.String getBrands) throws java.rmi.RemoteException{
    if (brandMasterService_PortType == null)
      _initBrandMasterServiceProxy();
    return brandMasterService_PortType.getBrand(getBrands);
  }
  
  public java.lang.String createBrand(java.lang.String crate) throws java.rmi.RemoteException{
    if (brandMasterService_PortType == null)
      _initBrandMasterServiceProxy();
    return brandMasterService_PortType.createBrand(crate);
  }
  
  
}