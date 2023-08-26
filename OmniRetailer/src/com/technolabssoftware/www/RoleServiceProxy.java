package com.technolabssoftware.www;

public class RoleServiceProxy implements com.technolabssoftware.www.RoleService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.RoleService_PortType roleService_PortType = null;
  
  public RoleServiceProxy() {
    _initRoleServiceProxy();
  }
  
  public RoleServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initRoleServiceProxy();
  }
  
  private void _initRoleServiceProxy() {
    try {
      roleService_PortType = (new com.technolabssoftware.www.RoleService_ServiceLocator()).getRoleServiceImplPort();
      if (roleService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)roleService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)roleService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (roleService_PortType != null)
      ((javax.xml.rpc.Stub)roleService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.RoleService_PortType getRoleService_PortType() {
    if (roleService_PortType == null)
      _initRoleServiceProxy();
    return roleService_PortType;
  }
  
  public java.lang.String deleteRole(java.lang.String roleNames) throws java.rmi.RemoteException{
    if (roleService_PortType == null)
      _initRoleServiceProxy();
    return roleService_PortType.deleteRole(roleNames);
  }
  
  public java.lang.String createRole(java.lang.String roleInfo) throws java.rmi.RemoteException{
    if (roleService_PortType == null)
      _initRoleServiceProxy();
    return roleService_PortType.createRole(roleInfo);
  }
  
  public java.lang.String updateRole(java.lang.String roleInfo) throws java.rmi.RemoteException{
    if (roleService_PortType == null)
      _initRoleServiceProxy();
    return roleService_PortType.updateRole(roleInfo);
  }
  
  public java.lang.String getRoles(java.lang.String roleInfo) throws java.rmi.RemoteException{
    if (roleService_PortType == null)
      _initRoleServiceProxy();
    return roleService_PortType.getRoles(roleInfo);
  }
  
  
}