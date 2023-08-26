package com.technolabssoftware.www;

public class DepartmentProxy implements com.technolabssoftware.www.Department {
  private String _endpoint = null;
  private com.technolabssoftware.www.Department department = null;
  
  public DepartmentProxy() {
    _initDepartmentProxy();
  }
  
  public DepartmentProxy(String endpoint) {
    _endpoint = endpoint;
    _initDepartmentProxy();
  }
  
  private void _initDepartmentProxy() {
    try {
      department = (new com.technolabssoftware.www.DepartmentServiceLocator()).getDepartmentImplPort();
      if (department != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)department)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)department)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (department != null)
      ((javax.xml.rpc.Stub)department)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Department getDepartment() {
    if (department == null)
      _initDepartmentProxy();
    return department;
  }
  
  public java.lang.String updateDepartment(java.lang.String departmentDetails) throws java.rmi.RemoteException{
    if (department == null)
      _initDepartmentProxy();
    return department.updateDepartment(departmentDetails);
  }
  
  public java.lang.String deleteDepartment(java.lang.String requestHeader, java.lang.String primaryDepartment) throws java.rmi.RemoteException{
    if (department == null)
      _initDepartmentProxy();
    return department.deleteDepartment(requestHeader, primaryDepartment);
  }
  
  public java.lang.String createDepartment(java.lang.String departmentDetails) throws java.rmi.RemoteException{
    if (department == null)
      _initDepartmentProxy();
    return department.createDepartment(departmentDetails);
  }
  
  public java.lang.String getDepartments(java.lang.String departmentDetails) throws java.rmi.RemoteException{
    if (department == null)
      _initDepartmentProxy();
    return department.getDepartments(departmentDetails);
  }
  
  
}