package com.technolabssoftware.www;

public class ProductMasterProxy implements com.technolabssoftware.www.ProductMaster {
  private String _endpoint = null;
  private com.technolabssoftware.www.ProductMaster productMaster = null;
  
  public ProductMasterProxy() {
    _initProductMasterProxy();
  }
  
  public ProductMasterProxy(String endpoint) {
    _endpoint = endpoint;
    _initProductMasterProxy();
  }
  
  private void _initProductMasterProxy() {
    try {
      productMaster = (new com.technolabssoftware.www.ProductMasterServiceLocator()).getProductMasterImplPort();
      if (productMaster != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)productMaster)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)productMaster)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (productMaster != null)
      ((javax.xml.rpc.Stub)productMaster)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.ProductMaster getProductMaster() {
    if (productMaster == null)
      _initProductMasterProxy();
    return productMaster;
  }
  
  public java.lang.String deleteProducts(java.lang.String productIds) throws java.rmi.RemoteException{
    if (productMaster == null)
      _initProductMasterProxy();
    return productMaster.deleteProducts(productIds);
  }
  
  public java.lang.String updateProduct(java.lang.String productDetails) throws java.rmi.RemoteException{
    if (productMaster == null)
      _initProductMasterProxy();
    return productMaster.updateProduct(productDetails);
  }
  
  public java.lang.String getProducts(java.lang.String productMasterSearchCriteria) throws java.rmi.RemoteException{
    if (productMaster == null)
      _initProductMasterProxy();
    return productMaster.getProducts(productMasterSearchCriteria);
  }
  
  public java.lang.String getProductDetails(java.lang.String productIds) throws java.rmi.RemoteException{
    if (productMaster == null)
      _initProductMasterProxy();
    return productMaster.getProductDetails(productIds);
  }
  
  public java.lang.String createProduct(java.lang.String productDetails) throws java.rmi.RemoteException{
    if (productMaster == null)
      _initProductMasterProxy();
    return productMaster.createProduct(productDetails);
  }
  
  
}