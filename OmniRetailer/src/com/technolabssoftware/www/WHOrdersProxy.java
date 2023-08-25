package com.technolabssoftware.www;

public class WHOrdersProxy implements com.technolabssoftware.www.WHOrders {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHOrders wHOrders = null;
  
  public WHOrdersProxy() {
    _initWHOrdersProxy();
  }
  
  public WHOrdersProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHOrdersProxy();
  }
  
  private void _initWHOrdersProxy() {
    try {
      wHOrders = (new com.technolabssoftware.www.WHOrderServicesLocator()).getWHOrderImplPort();
      if (wHOrders != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHOrders)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHOrders)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHOrders != null)
      ((javax.xml.rpc.Stub)wHOrders)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHOrders getWHOrders() {
    if (wHOrders == null)
      _initWHOrdersProxy();
    return wHOrders;
  }
  
  public java.lang.String getOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHOrders == null)
      _initWHOrdersProxy();
    return wHOrders.getOrderDetails(orderDetails);
  }
  
  public java.lang.String deleteOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHOrders == null)
      _initWHOrdersProxy();
    return wHOrders.deleteOrder(orderDetails);
  }
  
  public java.lang.String createOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHOrders == null)
      _initWHOrdersProxy();
    return wHOrders.createOrder(orderDetails);
  }
  
  public java.lang.String updateOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHOrders == null)
      _initWHOrdersProxy();
    return wHOrders.updateOrder(orderDetails);
  }
  
  public java.lang.String getOrders(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (wHOrders == null)
      _initWHOrdersProxy();
    return wHOrders.getOrders(orderDetails);
  }
  
  
}