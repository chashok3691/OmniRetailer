package com.technolabssoftware.www;

public class WHStockIssuesProxy implements com.technolabssoftware.www.WHStockIssues {
  private String _endpoint = null;
  private com.technolabssoftware.www.WHStockIssues wHStockIssues = null;
  
  public WHStockIssuesProxy() {
    _initWHStockIssuesProxy();
  }
  
  public WHStockIssuesProxy(String endpoint) {
    _endpoint = endpoint;
    _initWHStockIssuesProxy();
  }
  
  private void _initWHStockIssuesProxy() {
    try {
      wHStockIssues = (new com.technolabssoftware.www.WHStockIssueServicesLocator()).getWHStockIssuesImplPort();
      if (wHStockIssues != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)wHStockIssues)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)wHStockIssues)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (wHStockIssues != null)
      ((javax.xml.rpc.Stub)wHStockIssues)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.WHStockIssues getWHStockIssues() {
    if (wHStockIssues == null)
      _initWHStockIssuesProxy();
    return wHStockIssues;
  }
  
  public java.lang.String getStockIssueIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (wHStockIssues == null)
      _initWHStockIssuesProxy();
    return wHStockIssues.getStockIssueIds(searchCriteria);
  }
  
  public java.lang.String getStockIssue(java.lang.String issueID) throws java.rmi.RemoteException{
    if (wHStockIssues == null)
      _initWHStockIssuesProxy();
    return wHStockIssues.getStockIssue(issueID);
  }
  
  public java.lang.String createStockIssue(java.lang.String stockIssueDetails) throws java.rmi.RemoteException{
    if (wHStockIssues == null)
      _initWHStockIssuesProxy();
    return wHStockIssues.createStockIssue(stockIssueDetails);
  }
  
  public java.lang.String getStockIssues(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (wHStockIssues == null)
      _initWHStockIssuesProxy();
    return wHStockIssues.getStockIssues(searchCriteria);
  }
  
  public java.lang.String updateStockIssue(java.lang.String stockIssueDetails) throws java.rmi.RemoteException{
    if (wHStockIssues == null)
      _initWHStockIssuesProxy();
    return wHStockIssues.updateStockIssue(stockIssueDetails);
  }
  
  
}