package com.technolabssoftware.www;

public class StockIssuesProxy implements com.technolabssoftware.www.StockIssues {
  private String _endpoint = null;
  private com.technolabssoftware.www.StockIssues stockIssues = null;
  
  public StockIssuesProxy() {
    _initStockIssuesProxy();
  }
  
  public StockIssuesProxy(String endpoint) {
    _endpoint = endpoint;
    _initStockIssuesProxy();
  }
  
  private void _initStockIssuesProxy() {
    try {
      stockIssues = (new com.technolabssoftware.www.StockIssueServiceLocator()).getStockIssuesImplPort();
      if (stockIssues != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)stockIssues)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)stockIssues)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (stockIssues != null)
      ((javax.xml.rpc.Stub)stockIssues)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.StockIssues getStockIssues() {
    if (stockIssues == null)
      _initStockIssuesProxy();
    return stockIssues;
  }
  
  public java.lang.String getStockIssueIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockIssues == null)
      _initStockIssuesProxy();
    return stockIssues.getStockIssueIds(searchCriteria);
  }
  
  public java.lang.String getStockIssue(java.lang.String issueID) throws java.rmi.RemoteException{
    if (stockIssues == null)
      _initStockIssuesProxy();
    return stockIssues.getStockIssue(issueID);
  }
  
  public java.lang.String createStockIssue(java.lang.String stockIssueDetails) throws java.rmi.RemoteException{
    if (stockIssues == null)
      _initStockIssuesProxy();
    return stockIssues.createStockIssue(stockIssueDetails);
  }
  
  public java.lang.String getStockIssues(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (stockIssues == null)
      _initStockIssuesProxy();
    return stockIssues.getStockIssues(searchCriteria);
  }
  
  public java.lang.String updateStockIssue(java.lang.String stockIssueDetails) throws java.rmi.RemoteException{
    if (stockIssues == null)
      _initStockIssuesProxy();
    return stockIssues.updateStockIssue(stockIssueDetails);
  }
  
  
}