package com.technolabssoftware.www;

public class SalesReportsProxy implements com.technolabssoftware.www.SalesReports_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.SalesReports_PortType salesReports_PortType = null;
  
  public SalesReportsProxy() {
    _initSalesReportsProxy();
  }
  
  public SalesReportsProxy(String endpoint) {
    _endpoint = endpoint;
    _initSalesReportsProxy();
  }
  
  private void _initSalesReportsProxy() {
    try {
      salesReports_PortType = (new com.technolabssoftware.www.SalesReports_ServiceLocator()).getSalesReportsImplPort();
      if (salesReports_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)salesReports_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)salesReports_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (salesReports_PortType != null)
      ((javax.xml.rpc.Stub)salesReports_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.SalesReports_PortType getSalesReports_PortType() {
    if (salesReports_PortType == null)
      _initSalesReportsProxy();
    return salesReports_PortType;
  }
  
  public java.lang.String getSalesReportsCounter(java.lang.String reportsInfo) throws java.rmi.RemoteException{
    if (salesReports_PortType == null)
      _initSalesReportsProxy();
    return salesReports_PortType.getSalesReportsCounter(reportsInfo);
  }
  
  
}