package com.technolabssoftware.www;

public class WHInvoicesProxy implements com.technolabssoftware.www.WHInvoices {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHInvoices wHInvoices = null;
  
  public WHInvoicesProxy() {
    _initWHInvoicesProxy();
  }
  
  public WHInvoicesProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHInvoicesProxy();
  }
  
  private void _initWHInvoicesProxy() {
    try {
      wHInvoices = (new com.technolabssoftware.www.WHInvoiceServicesLocator()).getWHInvoicesImplPort();
      if (wHInvoices != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHInvoices)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHInvoices)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHInvoices != null)
      ((javax.xml.rpc.Stub)wHInvoices)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHInvoices getWHInvoices() {
    if (wHInvoices == null)
      _initWHInvoicesProxy();
    return wHInvoices;
  }
  
  public java.lang.String getInvoices(java.lang.String invoiceDetails) throws java.rmi.RemoteException{
    if (wHInvoices == null)
      _initWHInvoicesProxy();
    return wHInvoices.getInvoices(invoiceDetails);
  }
  
  public java.lang.String updateInvoice(java.lang.String invoiceDetails) throws java.rmi.RemoteException{
    if (wHInvoices == null)
      _initWHInvoicesProxy();
    return wHInvoices.updateInvoice(invoiceDetails);
  }
  
  public java.lang.String createInvoice(java.lang.String invoiceDetails) throws java.rmi.RemoteException{
    if (wHInvoices == null)
      _initWHInvoicesProxy();
    return wHInvoices.createInvoice(invoiceDetails);
  }
  
  public java.lang.String getInvoiceDetails(java.lang.String invoiceDetails) throws java.rmi.RemoteException{
    if (wHInvoices == null)
      _initWHInvoicesProxy();
    return wHInvoices.getInvoiceDetails(invoiceDetails);
  }
  
  
}