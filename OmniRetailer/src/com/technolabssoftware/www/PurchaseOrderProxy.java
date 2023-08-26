package com.technolabssoftware.www;

public class PurchaseOrderProxy implements com.technolabssoftware.www.PurchaseOrder {
  private String _endpoint = null;
  private com.technolabssoftware.www.PurchaseOrder purchaseOrder = null;
  
  public PurchaseOrderProxy() {
    _initPurchaseOrderProxy();
  }
  
  public PurchaseOrderProxy(String endpoint) {
    _endpoint = endpoint;
    _initPurchaseOrderProxy();
  }
  
  private void _initPurchaseOrderProxy() {
    try {
      purchaseOrder = (new com.technolabssoftware.www.PurchaseOrdersLocator()).getPurchaseOrdersImplPort();
      if (purchaseOrder != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)purchaseOrder)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)purchaseOrder)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (purchaseOrder != null)
      ((javax.xml.rpc.Stub)purchaseOrder)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.PurchaseOrder getPurchaseOrder() {
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder;
  }
  
  public java.lang.String getPOReference(java.lang.String getPOReferenceRequest) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.getPOReference(getPOReferenceRequest);
  }
  
  public java.lang.String getPurchaseOrders(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.getPurchaseOrders(orderDetails);
  }
  
  public java.lang.String deletePurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.deletePurchaseOrder(orderDetails);
  }
  
  public java.lang.String createPurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.createPurchaseOrder(orderDetails);
  }
  
  public java.lang.String searchPurchaseOrders(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.searchPurchaseOrders(searchCriteria);
  }
  
  public java.lang.String getPurchaseOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.getPurchaseOrderDetails(orderDetails);
  }
  
  public java.lang.String updatePurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException{
    if (purchaseOrder == null)
      _initPurchaseOrderProxy();
    return purchaseOrder.updatePurchaseOrder(orderDetails);
  }
  
  
}