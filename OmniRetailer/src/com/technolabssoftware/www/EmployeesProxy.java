package com.technolabssoftware.www;

public class EmployeesProxy implements com.technolabssoftware.www.Employees_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.Employees_PortType employees_PortType = null;
  
  public EmployeesProxy() {
    _initEmployeesProxy();
  }
  
  public EmployeesProxy(String endpoint) {
    _endpoint = endpoint;
    _initEmployeesProxy();
  }
  
  private void _initEmployeesProxy() {
    try {
      employees_PortType = (new com.technolabssoftware.www.Employees_ServiceLocator()).getEmployeeImplPort();
      if (employees_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)employees_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)employees_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (employees_PortType != null)
      ((javax.xml.rpc.Stub)employees_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Employees_PortType getEmployees_PortType() {
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType;
  }
  
  public java.lang.String getEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException{
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType.getEmployee(employeeDetails);
  }
  
  public java.lang.String deleteEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException{
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType.deleteEmployee(employeeDetails);
  }
  
  public java.lang.String getEmployeeByRole(java.lang.String employeeDetails) throws java.rmi.RemoteException{
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType.getEmployeeByRole(employeeDetails);
  }
  
  public java.lang.String updateEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException{
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType.updateEmployee(employeeDetails);
  }
  
  public java.lang.String createEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException{
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType.createEmployee(employeeDetails);
  }
  
  public java.lang.String getEmployees(java.lang.String employeeDetails) throws java.rmi.RemoteException{
    if (employees_PortType == null)
      _initEmployeesProxy();
    return employees_PortType.getEmployees(employeeDetails);
  }
  
  
}