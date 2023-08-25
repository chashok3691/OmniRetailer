/**
 * Employees_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class Employees_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.Employees_Service {

    public Employees_ServiceLocator() {
    }


    public Employees_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public Employees_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for EmployeeImplPort
    private java.lang.String EmployeeImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/Employees";

    public java.lang.String getEmployeeImplPortAddress() {
        return EmployeeImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String EmployeeImplPortWSDDServiceName = "EmployeeImplPort";

    public java.lang.String getEmployeeImplPortWSDDServiceName() {
        return EmployeeImplPortWSDDServiceName;
    }

    public void setEmployeeImplPortWSDDServiceName(java.lang.String name) {
        EmployeeImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.Employees_PortType getEmployeeImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(EmployeeImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getEmployeeImplPort(endpoint);
    }

    public com.technolabssoftware.www.Employees_PortType getEmployeeImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.EmployeesSoapBindingStub _stub = new com.technolabssoftware.www.EmployeesSoapBindingStub(portAddress, this);
            _stub.setPortName(getEmployeeImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setEmployeeImplPortEndpointAddress(java.lang.String address) {
        EmployeeImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.Employees_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.EmployeesSoapBindingStub _stub = new com.technolabssoftware.www.EmployeesSoapBindingStub(new java.net.URL(EmployeeImplPort_address), this);
                _stub.setPortName(getEmployeeImplPortWSDDServiceName());
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
        if ("EmployeeImplPort".equals(inputPortName)) {
            return getEmployeeImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "Employees");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "EmployeeImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("EmployeeImplPort".equals(portName)) {
            setEmployeeImplPortEndpointAddress(address);
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
