package com.technolabssoftware.www;

public class OrdersProxy implements com.technolabssoftware.www.Orders {
  private String _endpoint = null;
  private com.technolabssoftware.www.Orders orders = null;
  
  public OrdersProxy() {
    _initOrdersProxy();
  }
  
  public OrdersProxy(String endpoint) {
    _endpoint = endpoint;
    _initOrdersProxy();
  }
  
  private void _initOrdersProxy() {
    try {
      orders = (new com.technolabssoftware.www.OrderServiceLocator()).getOrderImplPort();
      if (orders != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)orders)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)orders)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (orders != null)
      ((javax.xml.rpc.Stub)orders)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Orders getOrders() {
    if (orders == null)
      _initOrdersProxy();
    return orders;
  }
  
  public java.lang.String updateOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.updateOrder(orderDetails);
  }
  
  public java.lang.String searchOrders(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.searchOrders(searchCriteria);
  }
  
  public java.lang.String getOrders(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.getOrders(orderDetails);
  }
  
  public java.lang.String getOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.getOrderDetails(orderDetails);
  }
  
  public java.lang.String createOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.createOrder(orderDetails);
  }
  
  public java.lang.String getCustomerOrders(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.getCustomerOrders(customerDetails);
  }
  
  public java.lang.String getOrdersSummary(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.getOrdersSummary(customerDetails);
  }
  
  public java.lang.String cancelOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (orders == null)
      _initOrdersProxy();
    return orders.cancelOrder(orderDetails);
  }
  
  
}