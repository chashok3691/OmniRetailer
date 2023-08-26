package com.technolabssoftware.www;

public class WHPurchaseOrdersProxy implements com.technolabssoftware.www.WHPurchaseOrders_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHPurchaseOrders_PortType wHPurchaseOrders_PortType = null;
  
  public WHPurchaseOrdersProxy() {
    _initWHPurchaseOrdersProxy();
  }
  
  public WHPurchaseOrdersProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHPurchaseOrdersProxy();
  }
  
  private void _initWHPurchaseOrdersProxy() {
    try {
      wHPurchaseOrders_PortType = (new com.technolabssoftware.www.WHPurchaseOrders_ServiceLocator()).getWHPurchaseOrdersImplPort();
      if (wHPurchaseOrders_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHPurchaseOrders_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHPurchaseOrders_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHPurchaseOrders_PortType != null)
      ((javax.xml.rpc.Stub)wHPurchaseOrders_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHPurchaseOrders_PortType getWHPurchaseOrders_PortType() {
    if (wHPurchaseOrders_PortType == null)
      _initWHPurchaseOrdersProxy();
    return wHPurchaseOrders_PortType;
  }
  
  public java.lang.String getPurchaseOrders(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHPurchaseOrders_PortType == null)
      _initWHPurchaseOrdersProxy();
    return wHPurchaseOrders_PortType.getPurchaseOrders(orderDetails);
  }
  
  public java.lang.String deletePurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHPurchaseOrders_PortType == null)
      _initWHPurchaseOrdersProxy();
    return wHPurchaseOrders_PortType.deletePurchaseOrder(orderDetails);
  }
  
  public java.lang.String createPurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHPurchaseOrders_PortType == null)
      _initWHPurchaseOrdersProxy();
    return wHPurchaseOrders_PortType.createPurchaseOrder(orderDetails);
  }
  
  public java.lang.String getPurchaseOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHPurchaseOrders_PortType == null)
      _initWHPurchaseOrdersProxy();
    return wHPurchaseOrders_PortType.getPurchaseOrderDetails(orderDetails);
  }
  
  public java.lang.String updatePurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHPurchaseOrders_PortType == null)
      _initWHPurchaseOrdersProxy();
    return wHPurchaseOrders_PortType.updatePurchaseOrder(orderDetails);
  }
  
  
}