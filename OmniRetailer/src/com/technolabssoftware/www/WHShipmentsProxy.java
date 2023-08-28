package com.technolabssoftware.www;

public class WHShipmentsProxy implements com.technolabssoftware.www.WHShipments {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHShipments wHShipments = null;
  
  public WHShipmentsProxy() {
    _initWHShipmentsProxy();
  }
  
  public WHShipmentsProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHShipmentsProxy();
  }
  
  private void _initWHShipmentsProxy() {
    try {
      wHShipments = (new com.technolabssoftware.www.WHShippingServicesLocator()).getWHShipmentsImplPort();
      if (wHShipments != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHShipments)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHShipments)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHShipments != null)
      ((javax.xml.rpc.Stub)wHShipments)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHShipments getWHShipments() {
    if (wHShipments == null)
      _initWHShipmentsProxy();
    return wHShipments;
  }
  
  public java.lang.String getShipmentDetails(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (wHShipments == null)
      _initWHShipmentsProxy();
    return wHShipments.getShipmentDetails(shipmentDetails);
  }
  
  public java.lang.String createShipment(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (wHShipments == null)
      _initWHShipmentsProxy();
    return wHShipments.createShipment(shipmentDetails);
  }
  
  public java.lang.String updateShipment(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (wHShipments == null)
      _initWHShipmentsProxy();
    return wHShipments.updateShipment(shipmentDetails);
  }
  
  public java.lang.String getShipments(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (wHShipments == null)
      _initWHShipmentsProxy();
    return wHShipments.getShipments(shipmentDetails);
  }
  
  public java.lang.String getShipmentIds(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (wHShipments == null)
      _initWHShipmentsProxy();
    return wHShipments.getShipmentIds(shipmentDetails);
  }
  
  
}