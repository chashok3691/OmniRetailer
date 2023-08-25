package com.technolabssoftware.www;

public class CustomerProxy implements com.technolabssoftware.www.Customer {
  private String _endpoint = null;
  private com.technolabssoftware.www.Customer customer = null;
  
  public CustomerProxy() {
    _initCustomerProxy();
  }
  
  public CustomerProxy(String endpoint) {
    _endpoint = endpoint;
    _initCustomerProxy();
  }
  
  private void _initCustomerProxy() {
    try {
      customer = (new com.technolabssoftware.www.CustomerServiceLocator()).getCustomerImplPort();
      if (customer != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)customer)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)customer)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (customer != null)
      ((javax.xml.rpc.Stub)customer)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Customer getCustomer() {
    if (customer == null)
      _initCustomerProxy();
    return customer;
  }
  
  public java.lang.String getBatchNamesByNotificationCategory(java.lang.String filters) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.getBatchNamesByNotificationCategory(filters);
  }
  
  public java.lang.String activateCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.activateCustomer(customerDetails);
  }
  
  public java.lang.String updateCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.updateCustomer(customerDetails);
  }
  
  public java.lang.String getCustomerVisits(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.getCustomerVisits(customerDetails);
  }
  
  public java.lang.String registerCustomer(java.lang.String request) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.registerCustomer(request);
  }
  
  public java.lang.String resetCustomerPassword(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.resetCustomerPassword(customerDetails);
  }
  
  public java.lang.String getCustomerDetails(java.lang.String phone) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.getCustomerDetails(phone);
  }
  
  public java.lang.String enableOrDisableBatches(java.lang.String filters) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.enableOrDisableBatches(filters);
  }
  
  public java.lang.String forgetCustomerPassword(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.forgetCustomerPassword(customerDetails);
  }
  
  public java.lang.String getCustomerList(java.lang.String filters) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.getCustomerList(filters);
  }
  
  public java.lang.String notifyCustomers(java.lang.String filters) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.notifyCustomers(filters);
  }
  
  public java.lang.String authenticateCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.authenticateCustomer(customerDetails);
  }
  
  public java.lang.String generateOtp(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.generateOtp(customerDetails);
  }
  
  public java.lang.String createBatch(java.lang.String filters) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.createBatch(filters);
  }
  
  public java.lang.String getBatchInfo(java.lang.String filters) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.getBatchInfo(filters);
  }
  
  public java.lang.String createCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.createCustomer(customerDetails);
  }
  
  public java.lang.String changeCustomerPassword(java.lang.String customerDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.changeCustomerPassword(customerDetails);
  }
  
  public java.lang.String customerNotifications(java.lang.String notificationDetails) throws java.rmi.RemoteException{
    if (customer == null)
      _initCustomerProxy();
    return customer.customerNotifications(notificationDetails);
  }
  
  
}