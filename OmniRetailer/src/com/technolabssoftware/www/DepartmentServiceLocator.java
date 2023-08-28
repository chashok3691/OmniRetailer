/**
 * DepartmentServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class DepartmentServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.DepartmentService {

    public DepartmentServiceLocator() {
    }


    public DepartmentServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public DepartmentServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for DepartmentImplPort
    private java.lang.String DepartmentImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/DepartmentServices";

    public java.lang.String getDepartmentImplPortAddress() {
        return DepartmentImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String DepartmentImplPortWSDDServiceName = "DepartmentImplPort";

    public java.lang.String getDepartmentImplPortWSDDServiceName() {
        return DepartmentImplPortWSDDServiceName;
    }

    public void setDepartmentImplPortWSDDServiceName(java.lang.String name) {
        DepartmentImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.Department getDepartmentImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(DepartmentImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getDepartmentImplPort(endpoint);
    }

    public com.technolabssoftware.www.Department getDepartmentImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.DepartmentServiceSoapBindingStub _stub = new com.technolabssoftware.www.DepartmentServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getDepartmentImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setDepartmentImplPortEndpointAddress(java.lang.String address) {
        DepartmentImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.Department.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.DepartmentServiceSoapBindingStub _stub = new com.technolabssoftware.www.DepartmentServiceSoapBindingStub(new java.net.URL(DepartmentImplPort_address), this);
                _stub.setPortName(getDepartmentImplPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("DepartmentImplPort".equals(inputPortName)) {
            return getDepartmentImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "DepartmentService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "DepartmentImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("DepartmentImplPort".equals(portName)) {
            setDepartmentImplPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
