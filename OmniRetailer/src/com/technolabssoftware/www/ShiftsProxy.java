package com.technolabssoftware.www;

public class ShiftsProxy implements com.technolabssoftware.www.Shifts {
  private String _endpoint = null;
  private com.technolabssoftware.www.Shifts shifts = null;
  
  public ShiftsProxy() {
    _initShiftsProxy();
  }
  
  public ShiftsProxy(String endpoint) {
    _endpoint = endpoint;
    _initShiftsProxy();
  }
  
  private void _initShiftsProxy() {
    try {
      shifts = (new com.technolabssoftware.www.ShiftsImplServiceLocator()).getShiftServicesPort();
      if (shifts != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)shifts)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)shifts)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (shifts != null)
      ((javax.xml.rpc.Stub)shifts)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Shifts getShifts() {
    if (shifts == null)
      _initShiftsProxy();
    return shifts;
  }
  
  public java.lang.String getShifts(java.lang.String shiftDetails) throws java.rmi.RemoteException{
    if (shifts == null)
      _initShiftsProxy();
    return shifts.getShifts(shiftDetails);
  }
  
  public java.lang.String updateShift(java.lang.String shiftDetails) throws java.rmi.RemoteException{
    if (shifts == null)
      _initShiftsProxy();
    return shifts.updateShift(shiftDetails);
  }
  
  public java.lang.String deleteShift(java.lang.String shiftDetails) throws java.rmi.RemoteException{
    if (shifts == null)
      _initShiftsProxy();
    return shifts.deleteShift(shiftDetails);
  }
  
  public java.lang.String createShift(java.lang.String shiftDetails) throws java.rmi.RemoteException{
    if (shifts == null)
      _initShiftsProxy();
    return shifts.createShift(shiftDetails);
  }
  
  public java.lang.String getShiftDetails(java.lang.String shiftDetails) throws java.rmi.RemoteException{
    if (shifts == null)
      _initShiftsProxy();
    return shifts.getShiftDetails(shiftDetails);
  }
  
  
}