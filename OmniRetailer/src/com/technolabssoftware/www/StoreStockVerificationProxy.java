package com.technolabssoftware.www;

public class StoreStockVerificationProxy implements com.technolabssoftware.www.StoreStockVerification {
  private String _endpoint = null;
  private com.technolabssoftware.www.StoreStockVerification storeStockVerification = null;
  
  public StoreStockVerificationProxy() {
    _initStoreStockVerificationProxy();
  }
  
  public StoreStockVerificationProxy(String endpoint) {
    _endpoint = endpoint;
    _initStoreStockVerificationProxy();
  }
  
  private void _initStoreStockVerificationProxy() {
    try {
      storeStockVerification = (new com.technolabssoftware.www.StoreStockVerificationServicesLocator()).getStoreStockVerificationImplPort();
      if (storeStockVerification != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)storeStockVerification)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)storeStockVerification)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (storeStockVerification != null)
      ((javax.xml.rpc.Stub)storeStockVerification)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StoreStockVerification getStoreStockVerification() {
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification;
  }
  
  public java.lang.String getStorageUnit(java.lang.String store_location) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getStorageUnit(store_location);
  }
  
  public java.lang.String getProductVerification(java.lang.String getProductVerificationRequest) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getProductVerification(getProductVerificationRequest);
  }
  
  public java.lang.String getRawMaterialVerification(java.lang.String getVerificationRequest) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getRawMaterialVerification(getVerificationRequest);
  }
  
  public java.lang.String getSkuDetails(java.lang.String productId) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getSkuDetails(productId);
  }
  
  public java.lang.String getRawMaterials(java.lang.String productId) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getRawMaterials(productId);
  }
  
  public java.lang.String updateRawMaterial(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.updateRawMaterial(stockVerificationDetails);
  }
  
  public java.lang.String getProductVerificationDetails(java.lang.String getProductVerificationDetailsRequest) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getProductVerificationDetails(getProductVerificationDetailsRequest);
  }
  
  public java.lang.String createStock(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.createStock(stockVerificationDetails);
  }
  
  public java.lang.String getStorageLocation(java.lang.String storage_unit) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getStorageLocation(storage_unit);
  }
  
  public java.lang.String getRawMaterialVerificationDetails(java.lang.String getVerificationDetailsRequest) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.getRawMaterialVerificationDetails(getVerificationDetailsRequest);
  }
  
  public java.lang.String updateStock(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException{
    if (storeStockVerification == null)
      _initStoreStockVerificationProxy();
    return storeStockVerification.updateStock(stockVerificationDetails);
  }
  
  
}