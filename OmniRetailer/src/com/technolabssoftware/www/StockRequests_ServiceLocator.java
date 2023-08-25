/**
 * StockRequests_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class StockRequests_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.StockRequests_Service {

    public StockRequests_ServiceLocator() {
    }


    public StockRequests_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public StockRequests_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for StockRequestsImplPort
    private java.lang.String StockRequestsImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/StockRequests";

    public java.lang.String getStockRequestsImplPortAddress() {
        return StockRequestsImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String StockRequestsImplPortWSDDServiceName = "StockRequestsImplPort";

    public java.lang.String getStockRequestsImplPortWSDDServiceName() {
        return StockRequestsImplPortWSDDServiceName;
    }

    public void setStockRequestsImplPortWSDDServiceName(java.lang.String name) {
        StockRequestsImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.StockRequests_PortType getStockRequestsImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(StockRequestsImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getStockRequestsImplPort(endpoint);
    }

    public com.technolabssoftware.www.StockRequests_PortType getStockRequestsImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.StockRequestsSoapBindingStub _stub = new com.technolabssoftware.www.StockRequestsSoapBindingStub(portAddress, this);
            _stub.setPortName(getStockRequestsImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setStockRequestsImplPortEndpointAddress(java.lang.String address) {
        StockRequestsImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.StockRequests_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.StockRequestsSoapBindingStub _stub = new com.technolabssoftware.www.StockRequestsSoapBindingStub(new java.net.URL(StockRequestsImplPort_address), this);
                _stub.setPortName(getStockRequestsImplPortWSDDServiceName());
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
        if ("StockRequestsImplPort".equals(inputPortName)) {
            return getStockRequestsImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "StockRequests");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "StockRequestsImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("StockRequestsImplPort".equals(portName)) {
            setStockRequestsImplPortEndpointAddress(address);
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
