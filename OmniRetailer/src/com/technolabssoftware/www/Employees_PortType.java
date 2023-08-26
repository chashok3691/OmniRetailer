/**
 * Employees_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Employees_PortType extends java.rmi.Remote {
    public java.lang.String getEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException;
    public java.lang.String getEmployeeByRole(java.lang.String employeeDetails) throws java.rmi.RemoteException;
    public java.lang.String updateEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException;
    public java.lang.String createEmployee(java.lang.String employeeDetails) throws java.rmi.RemoteException;
    public java.lang.String getEmployees(java.lang.String employeeDetails) throws java.rmi.RemoteException;
}
