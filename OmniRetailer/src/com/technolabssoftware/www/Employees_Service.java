/**
 * Employees_Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Employees_Service extends javax.xml.rpc.Service {
    public java.lang.String getEmployeeImplPortAddress();

    public com.technolabssoftware.www.Employees_PortType getEmployeeImplPort() throws javax.xml.rpc.ServiceException;

    public com.technolabssoftware.www.Employees_PortType getEmployeeImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
