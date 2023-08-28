/**
 * Department.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Department extends java.rmi.Remote {
    public java.lang.String updateDepartment(java.lang.String departmentDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteDepartment(java.lang.String requestHeader, java.lang.String primaryDepartment) throws java.rmi.RemoteException;
    public java.lang.String createDepartment(java.lang.String departmentDetails) throws java.rmi.RemoteException;
    public java.lang.String getDepartments(java.lang.String departmentDetails) throws java.rmi.RemoteException;
}
