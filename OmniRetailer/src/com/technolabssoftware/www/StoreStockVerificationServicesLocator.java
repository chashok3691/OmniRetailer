/**
 * StoreStockVerificationServicesLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class StoreStockVerificationServicesLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.StoreStockVerificationServices {

    public StoreStockVerificationServicesLocator() {
    }


    public StoreStockVerificationServicesLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public StoreStockVerificationServicesLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for StoreStockVerificationImplPort
    private java.lang.String StoreStockVerificationImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/storeStockVerificationServices";

    public java.lang.String getStoreStockVerificationImplPortAddress() {
        return StoreStockVerificationImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String StoreStockVerificationImplPortWSDDServiceName = "StoreStockVerificationImplPort";

    public java.lang.String getStoreStockVerificationImplPortWSDDServiceName() {
        return StoreStockVerificationImplPortWSDDServiceName;
    }

    public void setStoreStockVerificationImplPortWSDDServiceName(java.lang.String name) {
        StoreStockVerificationImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.StoreStockVerification getStoreStockVerificationImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(StoreStockVerificationImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getStoreStockVerificationImplPort(endpoint);
    }

    public com.technolabssoftware.www.StoreStockVerification getStoreStockVerificationImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.StoreStockVerificationServicesSoapBindingStub _stub = new com.technolabssoftware.www.StoreStockVerificationServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getStoreStockVerificationImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setStoreStockVerificationImplPortEndpointAddress(java.lang.String address) {
        StoreStockVerificationImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.StoreStockVerification.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.StoreStockVerificationServicesSoapBindingStub _stub = new com.technolabssoftware.www.StoreStockVerificationServicesSoapBindingStub(new java.net.URL(StoreStockVerificationImplPort_address), this);
                _stub.setPortName(getStoreStockVerificationImplPortWSDDServiceName());
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
        if ("StoreStockVerificationImplPort".equals(inputPortName)) {
            return getStoreStockVerificationImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "storeStockVerificationServices");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "StoreStockVerificationImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("StoreStockVerificationImplPort".equals(portName)) {
            setStoreStockVerificationImplPortEndpointAddress(address);
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
