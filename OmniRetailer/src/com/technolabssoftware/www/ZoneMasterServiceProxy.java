package com.technolabssoftware.www;

public class ZoneMasterServiceProxy implements com.technolabssoftware.www.ZoneMasterService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.ZoneMasterService_PortType zoneMasterService_PortType = null;
  
  public ZoneMasterServiceProxy() {
    _initZoneMasterServiceProxy();
  }
  
  public ZoneMasterServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initZoneMasterServiceProxy();
  }
  
  private void _initZoneMasterServiceProxy() {
    try {
      zoneMasterService_PortType = (new com.technolabssoftware.www.ZoneMasterService_ServiceLocator()).getZoneMasterServiceImplPort();
      if (zoneMasterService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)zoneMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)zoneMasterService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (zoneMasterService_PortType != null)
      ((javax.xml.rpc.Stub)zoneMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.ZoneMasterService_PortType getZoneMasterService_PortType() {
    if (zoneMasterService_PortType == null)
      _initZoneMasterServiceProxy();
    return zoneMasterService_PortType;
  }
  
  public java.lang.String deleteZone(java.lang.String delteZoneDetails) throws java.rmi.RemoteException{
    if (zoneMasterService_PortType == null)
      _initZoneMasterServiceProxy();
    return zoneMasterService_PortType.deleteZone(delteZoneDetails);
  }
  
  public java.lang.String getZones(java.lang.String zoneID) throws java.rmi.RemoteException{
    if (zoneMasterService_PortType == null)
      _initZoneMasterServiceProxy();
    return zoneMasterService_PortType.getZones(zoneID);
  }
  
  public java.lang.String updateZone(java.lang.String updateZoneDetails) throws java.rmi.RemoteException{
    if (zoneMasterService_PortType == null)
      _initZoneMasterServiceProxy();
    return zoneMasterService_PortType.updateZone(updateZoneDetails);
  }
  
  public java.lang.String createZone(java.lang.String zoneDetails) throws java.rmi.RemoteException{
    if (zoneMasterService_PortType == null)
      _initZoneMasterServiceProxy();
    return zoneMasterService_PortType.createZone(zoneDetails);
  }
  
  
}