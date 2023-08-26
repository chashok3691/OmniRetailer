/**
 * MenuService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface MenuService extends javax.xml.rpc.Service {
    public java.lang.String getMenuImplPortAddress();

    public com.technolabssoftware.www.Menu getMenuImplPort() throws javax.xml.rpc.ServiceException;

    public com.technolabssoftware.www.Menu getMenuImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
