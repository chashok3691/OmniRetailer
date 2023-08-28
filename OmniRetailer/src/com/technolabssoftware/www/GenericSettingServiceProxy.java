package com.technolabssoftware.www;

public class GenericSettingServiceProxy implements com.technolabssoftware.www.GenericSettingService {
  private String _endpoint = null;
  private com.technolabssoftware.www.GenericSettingService genericSettingService = null;
  
  public GenericSettingServiceProxy() {
    _initGenericSettingServiceProxy();
  }
  
  public GenericSettingServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initGenericSettingServiceProxy();
  }
  
  private void _initGenericSettingServiceProxy() {
    try {
      genericSettingService = (new com.technolabssoftware.www.GenericServiceLocator()).getGenericServiceImplPort();
      if (genericSettingService != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)genericSettingService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)genericSettingService)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (genericSettingService != null)
      ((javax.xml.rpc.Stub)genericSettingService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.GenericSettingService getGenericSettingService() {
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService;
  }
  
  public java.lang.String updateCustomerSettings(java.lang.String updateStr) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updateCustomerSettings(updateStr);
  }
  
  public java.lang.String updatePrintSettings(java.lang.String updateSettings) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updatePrintSettings(updateSettings);
  }
  
  public java.lang.String createPrintSettings(java.lang.String createSettings) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createPrintSettings(createSettings);
  }
  
  public java.lang.String getMessageSettings(java.lang.String getMsgSettings) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getMessageSettings(getMsgSettings);
  }
  
  public java.lang.String createRegionalSettings(java.lang.String createRegional) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createRegionalSettings(createRegional);
  }
  
  public java.lang.String createIntegrationSettings(java.lang.String createIntegration) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createIntegrationSettings(createIntegration);
  }
  
  public java.lang.String updateSecuritySettings(java.lang.String updateSecurity) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updateSecuritySettings(updateSecurity);
  }
  
  public java.lang.String updateRegionalSettings(java.lang.String createRegional) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updateRegionalSettings(createRegional);
  }
  
  public java.lang.String getSecuritySettings(java.lang.String getSecurity) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getSecuritySettings(getSecurity);
  }
  
  public java.lang.String createMailSettings(java.lang.String crate) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createMailSettings(crate);
  }
  
  public java.lang.String createSecuritySettings(java.lang.String createSecurity) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createSecuritySettings(createSecurity);
  }
  
  public java.lang.String getPrintSettings(java.lang.String getSettings) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getPrintSettings(getSettings);
  }
  
  public java.lang.String getCustomerSettings(java.lang.String getCustomer) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getCustomerSettings(getCustomer);
  }
  
  public java.lang.String updateMailSettings(java.lang.String update) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updateMailSettings(update);
  }
  
  public java.lang.String updateIntegrationSettings(java.lang.String updateIntegration) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updateIntegrationSettings(updateIntegration);
  }
  
  public java.lang.String createCustomerSettings(java.lang.String createCustomer) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createCustomerSettings(createCustomer);
  }
  
  public java.lang.String getMailSettings(java.lang.String getMails) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getMailSettings(getMails);
  }
  
  public java.lang.String updateMessageSettings(java.lang.String update) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.updateMessageSettings(update);
  }
  
  public java.lang.String getRegionalSettings(java.lang.String getRegional) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getRegionalSettings(getRegional);
  }
  
  public java.lang.String getIntegrationSettings(java.lang.String getIntegration) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.getIntegrationSettings(getIntegration);
  }
  
  public java.lang.String createMessageSettings(java.lang.String crate) throws java.rmi.RemoteException{
    if (genericSettingService == null)
      _initGenericSettingServiceProxy();
    return genericSettingService.createMessageSettings(crate);
  }
  
  
}