/**
 * StoreTaxationService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class StoreTaxationService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.StoreTaxationService_Service {

    public StoreTaxationService_ServiceLocator() {
    }


    public StoreTaxationService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public StoreTaxationService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for StoreTaxationServiceImplPort
    private java.lang.String StoreTaxationServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/StoreTaxationService";

    public java.lang.String getStoreTaxationServiceImplPortAddress() {
        return StoreTaxationServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String StoreTaxationServiceImplPortWSDDServiceName = "StoreTaxationServiceImplPort";

    public java.lang.String getStoreTaxationServiceImplPortWSDDServiceName() {
        return StoreTaxationServiceImplPortWSDDServiceName;
    }

    public void setStoreTaxationServiceImplPortWSDDServiceName(java.lang.String name) {
        StoreTaxationServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.StoreTaxationService_PortType getStoreTaxationServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(StoreTaxationServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getStoreTaxationServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.StoreTaxationService_PortType getStoreTaxationServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.StoreTaxationServiceSoapBindingStub _stub = new com.technolabssoftware.www.StoreTaxationServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getStoreTaxationServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setStoreTaxationServiceImplPortEndpointAddress(java.lang.String address) {
        StoreTaxationServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.StoreTaxationService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.StoreTaxationServiceSoapBindingStub _stub = new com.technolabssoftware.www.StoreTaxationServiceSoapBindingStub(new java.net.URL(StoreTaxationServiceImplPort_address), this);
                _stub.setPortName(getStoreTaxationServiceImplPortWSDDServiceName());
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
        if ("StoreTaxationServiceImplPort".equals(inputPortName)) {
            return getStoreTaxationServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "StoreTaxationService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "StoreTaxationServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("StoreTaxationServiceImplPort".equals(portName)) {
            setStoreTaxationServiceImplPortEndpointAddress(address);
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
