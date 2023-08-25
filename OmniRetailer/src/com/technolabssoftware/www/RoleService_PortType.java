/**
 * RoleService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface RoleService_PortType extends java.rmi.Remote {
    public java.lang.String deleteRole(java.lang.String roleNames) throws java.rmi.RemoteException;
    public java.lang.String createRole(java.lang.String roleInfo) throws java.rmi.RemoteException;
    public java.lang.String updateRole(java.lang.String roleInfo) throws java.rmi.RemoteException;
    public java.lang.String getRoles(java.lang.String roleInfo) throws java.rmi.RemoteException;
}
