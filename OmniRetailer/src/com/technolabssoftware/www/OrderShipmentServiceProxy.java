package com.technolabssoftware.www;

public class OrderShipmentServiceProxy implements com.technolabssoftware.www.OrderShipmentService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.OrderShipmentService_PortType orderShipmentService_PortType = null;
  
  public OrderShipmentServiceProxy() {
    _initOrderShipmentServiceProxy();
  }
  
  public OrderShipmentServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initOrderShipmentServiceProxy();
  }
  
  private void _initOrderShipmentServiceProxy() {
    try {
      orderShipmentService_PortType = (new com.technolabssoftware.www.OrderShipmentService_ServiceLocator()).getOrderShipmentServiceImplPort();
      if (orderShipmentService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)orderShipmentService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)orderShipmentService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (orderShipmentService_PortType != null)
      ((javax.xml.rpc.Stub)orderShipmentService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.OrderShipmentService_PortType getOrderShipmentService_PortType() {
    if (orderShipmentService_PortType == null)
      _initOrderShipmentServiceProxy();
    return orderShipmentService_PortType;
  }
  
  public java.lang.String createShipment(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (orderShipmentService_PortType == null)
      _initOrderShipmentServiceProxy();
    return orderShipmentService_PortType.createShipment(shipmentDetails);
  }
  
  public java.lang.String getShipments(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (orderShipmentService_PortType == null)
      _initOrderShipmentServiceProxy();
    return orderShipmentService_PortType.getShipments(shipmentDetails);
  }
  
  public java.lang.String updateShipment(java.lang.String shipmentDetails) throws java.rmi.RemoteException{
    if (orderShipmentService_PortType == null)
      _initOrderShipmentServiceProxy();
    return orderShipmentService_PortType.updateShipment(shipmentDetails);
  }
  
  
}