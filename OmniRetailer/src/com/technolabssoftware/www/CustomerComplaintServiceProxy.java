package com.technolabssoftware.www;

public class CustomerComplaintServiceProxy implements com.technolabssoftware.www.CustomerComplaintService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.CustomerComplaintService_PortType customerComplaintService_PortType = null;
  
  public CustomerComplaintServiceProxy() {
    _initCustomerComplaintServiceProxy();
  }
  
  public CustomerComplaintServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initCustomerComplaintServiceProxy();
  }
  
  private void _initCustomerComplaintServiceProxy() {
    try {
      customerComplaintService_PortType = (new com.technolabssoftware.www.CustomerComplaintService_ServiceLocator()).getCustomerComplaintServiceImplPort();
      if (customerComplaintService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)customerComplaintService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)customerComplaintService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (customerComplaintService_PortType != null)
      ((javax.xml.rpc.Stub)customerComplaintService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.CustomerComplaintService_PortType getCustomerComplaintService_PortType() {
    if (customerComplaintService_PortType == null)
      _initCustomerComplaintServiceProxy();
    return customerComplaintService_PortType;
  }
  
  public java.lang.String getComplaint(java.lang.String getComplaintStr) throws java.rmi.RemoteException{
    if (customerComplaintService_PortType == null)
      _initCustomerComplaintServiceProxy();
    return customerComplaintService_PortType.getComplaint(getComplaintStr);
  }
  
  public java.lang.String createComplaint(java.lang.String createStr) throws java.rmi.RemoteException{
    if (customerComplaintService_PortType == null)
      _initCustomerComplaintServiceProxy();
    return customerComplaintService_PortType.createComplaint(createStr);
  }
  
  public java.lang.String updateComplaint(java.lang.String updateStr) throws java.rmi.RemoteException{
    if (customerComplaintService_PortType == null)
      _initCustomerComplaintServiceProxy();
    return customerComplaintService_PortType.updateComplaint(updateStr);
  }
  
  
}