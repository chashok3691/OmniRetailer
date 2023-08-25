/**
 * CustomerService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface CustomerService extends javax.xml.rpc.Service {
    public java.lang.String getCustomerImplPortAddress();

    public com.technolabssoftware.www.Customer getCustomerImplPort() throws javax.xml.rpc.ServiceException;

    public com.technolabssoftware.www.Customer getCustomerImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
