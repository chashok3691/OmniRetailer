package com.technolabssoftware.www;

public class CountersProxy implements com.technolabssoftware.www.Counters {
  private String _endpoint = null;
  private com.technolabssoftware.www.Counters counters = null;
  
  public CountersProxy() {
    _initCountersProxy();
  }
  
  public CountersProxy(String endpoint) {
    _endpoint = endpoint;
    _initCountersProxy();
  }
  
  private void _initCountersProxy() {
    try {
      counters = (new com.technolabssoftware.www.CountersServiceLocator()).getCountersImplPort();
      if (counters != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)counters)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)counters)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (counters != null)
      ((javax.xml.rpc.Stub)counters)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Counters getCounters() {
    if (counters == null)
      _initCountersProxy();
    return counters;
  }
  
  public java.lang.String deleteCounter(java.lang.String counterDetails) throws java.rmi.RemoteException{
    if (counters == null)
      _initCountersProxy();
    return counters.deleteCounter(counterDetails);
  }
  
  public java.lang.String createCounter(java.lang.String counterDetails) throws java.rmi.RemoteException{
    if (counters == null)
      _initCountersProxy();
    return counters.createCounter(counterDetails);
  }
  
  public java.lang.String getCounters(java.lang.String counterDetails) throws java.rmi.RemoteException{
    if (counters == null)
      _initCountersProxy();
    return counters.getCounters(counterDetails);
  }
  
  public java.lang.String updateCounter(java.lang.String counterDetails) throws java.rmi.RemoteException{
    if (counters == null)
      _initCountersProxy();
    return counters.updateCounter(counterDetails);
  }
  
  
}