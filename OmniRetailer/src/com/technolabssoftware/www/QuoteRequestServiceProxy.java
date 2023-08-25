package com.technolabssoftware.www;

public class QuoteRequestServiceProxy implements com.technolabssoftware.www.QuoteRequestService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.QuoteRequestService_PortType quoteRequestService_PortType = null;
  
  public QuoteRequestServiceProxy() {
    _initQuoteRequestServiceProxy();
  }
  
  public QuoteRequestServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initQuoteRequestServiceProxy();
  }
  
  private void _initQuoteRequestServiceProxy() {
    try {
      quoteRequestService_PortType = (new com.technolabssoftware.www.QuoteRequestService_ServiceLocator()).getQuoteRequestServiceImplPort();
      if (quoteRequestService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)quoteRequestService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)quoteRequestService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (quoteRequestService_PortType != null)
      ((javax.xml.rpc.Stub)quoteRequestService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.QuoteRequestService_PortType getQuoteRequestService_PortType() {
    if (quoteRequestService_PortType == null)
      _initQuoteRequestServiceProxy();
    return quoteRequestService_PortType;
  }
  
  public java.lang.String getQuoteRequests(java.lang.String getDetails) throws java.rmi.RemoteException{
    if (quoteRequestService_PortType == null)
      _initQuoteRequestServiceProxy();
    return quoteRequestService_PortType.getQuoteRequests(getDetails);
  }
  
  public java.lang.String createRequestForQuote(java.lang.String createDetails) throws java.rmi.RemoteException{
    if (quoteRequestService_PortType == null)
      _initQuoteRequestServiceProxy();
    return quoteRequestService_PortType.createRequestForQuote(createDetails);
  }
  
  public java.lang.String updateRequestForQuote(java.lang.String updateDetais) throws java.rmi.RemoteException{
    if (quoteRequestService_PortType == null)
      _initQuoteRequestServiceProxy();
    return quoteRequestService_PortType.updateRequestForQuote(updateDetais);
  }
  
  
}