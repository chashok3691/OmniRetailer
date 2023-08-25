package com.technolabssoftware.www;

public class UtilityMasterServiceProxy implements com.technolabssoftware.www.UtilityMasterService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.UtilityMasterService_PortType utilityMasterService_PortType = null;
  
  public UtilityMasterServiceProxy() {
    _initUtilityMasterServiceProxy();
  }
  
  public UtilityMasterServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initUtilityMasterServiceProxy();
  }
  
  private void _initUtilityMasterServiceProxy() {
    try {
      utilityMasterService_PortType = (new com.technolabssoftware.www.UtilityMasterService_ServiceLocator()).getUtilityMasterImplPort();
      if (utilityMasterService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)utilityMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)utilityMasterService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (utilityMasterService_PortType != null)
      ((javax.xml.rpc.Stub)utilityMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.UtilityMasterService_PortType getUtilityMasterService_PortType() {
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType;
  }
  
  public java.lang.String updateTaxDetails(java.lang.String taxDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.updateTaxDetails(taxDetails);
  }
  
  public java.lang.String createLocation(java.lang.String locationDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.createLocation(locationDetails);
  }
  
  public java.lang.String getLocation(java.lang.String locationDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getLocation(locationDetails);
  }
  
  public java.lang.String createTax(java.lang.String taxDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.createTax(taxDetails);
  }
  
  public java.lang.String getProductSubCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getProductSubCategory(categoryDetails);
  }
  
  public java.lang.String getCustomerDevices(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getCustomerDevices(customerDetails);
  }
  
  public java.lang.String updateCurrency(java.lang.String currency) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.updateCurrency(currency);
  }
  
  public java.lang.String createProductSubCategory(java.lang.String productSubCategoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.createProductSubCategory(productSubCategoryDetails);
  }
  
  public java.lang.String deleteProductSubCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.deleteProductSubCategory(categoryDetails);
  }
  
  public java.lang.String getLanguages(java.lang.String language) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getLanguages(language);
  }
  
  public java.lang.String updateLocation(java.lang.String locationDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.updateLocation(locationDetails);
  }
  
  public java.lang.String getTaxes(java.lang.String userId) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getTaxes(userId);
  }
  
  public java.lang.String getCurrency(java.lang.String currency) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getCurrency(currency);
  }
  
  public java.lang.String getWareHouses(java.lang.String wareHouse) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getWareHouses(wareHouse);
  }
  
  public java.lang.String createProductCategory(java.lang.String productCategoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.createProductCategory(productCategoryDetails);
  }
  
  public java.lang.String getProductCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getProductCategory(categoryDetails);
  }
  
  public java.lang.String deleteProductCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.deleteProductCategory(categoryDetails);
  }
  
  public java.lang.String deleteCurrency(java.lang.String currency) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.deleteCurrency(currency);
  }
  
  public java.lang.String getCategories(java.lang.String userId) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.getCategories(userId);
  }
  
  public java.lang.String updateProductCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.updateProductCategory(categoryDetails);
  }
  
  public java.lang.String updateProductSubCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.updateProductSubCategory(categoryDetails);
  }
  
  public java.lang.String deleteTaxDetails(java.lang.String taxDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.deleteTaxDetails(taxDetails);
  }
  
  public java.lang.String deleteLocation(java.lang.String locationDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.deleteLocation(locationDetails);
  }
  
  public java.lang.String createCurrency(java.lang.String currencyDetails) throws java.rmi.RemoteException{
    if (utilityMasterService_PortType == null)
      _initUtilityMasterServiceProxy();
    return utilityMasterService_PortType.createCurrency(currencyDetails);
  }
  
  
}