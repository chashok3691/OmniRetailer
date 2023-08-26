/**
 * DepartmentService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface DepartmentService extends javax.xml.rpc.Service {
    public java.lang.String getDepartmentImplPortAddress();

    public com.technolabssoftware.www.Department getDepartmentImplPort() throws javax.xml.rpc.ServiceException;

    public com.technolabssoftware.www.Department getDepartmentImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
