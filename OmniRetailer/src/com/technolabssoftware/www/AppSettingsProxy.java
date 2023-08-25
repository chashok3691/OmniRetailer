package com.technolabssoftware.www;

public class AppSettingsProxy implements com.technolabssoftware.www.AppSettings_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.AppSettings_PortType appSettings_PortType = null;
  
  public AppSettingsProxy() {
    _initAppSettingsProxy();
  }
  
  public AppSettingsProxy(String endpoint) {
    _endpoint = endpoint;
    _initAppSettingsProxy();
  }
  
  private void _initAppSettingsProxy() {
    try {
      appSettings_PortType = (new com.technolabssoftware.www.AppSettings_ServiceLocator()).getAppSettingsImplPort();
      if (appSettings_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)appSettings_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)appSettings_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (appSettings_PortType != null)
      ((javax.xml.rpc.Stub)appSettings_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.AppSettings_PortType getAppSettings_PortType() {
    if (appSettings_PortType == null)
      _initAppSettingsProxy();
    return appSettings_PortType;
  }
  
  public java.lang.String getAppSettings(java.lang.String customerInfo) throws java.rmi.RemoteException{
    if (appSettings_PortType == null)
      _initAppSettingsProxy();
    return appSettings_PortType.getAppSettings(customerInfo);
  }
  
  
}