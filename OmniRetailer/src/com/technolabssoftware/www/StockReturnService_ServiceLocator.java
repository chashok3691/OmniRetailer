/**
 * StockReturnService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class StockReturnService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.StockReturnService_Service {

    public StockReturnService_ServiceLocator() {
    }


    public StockReturnService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public StockReturnService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for StockReturnServiceImplPort
    private java.lang.String StockReturnServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/StockReturnService";

    public java.lang.String getStockReturnServiceImplPortAddress() {
        return StockReturnServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String StockReturnServiceImplPortWSDDServiceName = "StockReturnServiceImplPort";

    public java.lang.String getStockReturnServiceImplPortWSDDServiceName() {
        return StockReturnServiceImplPortWSDDServiceName;
    }

    public void setStockReturnServiceImplPortWSDDServiceName(java.lang.String name) {
        StockReturnServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.StockReturnService_PortType getStockReturnServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(StockReturnServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getStockReturnServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.StockReturnService_PortType getStockReturnServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.StockReturnServiceSoapBindingStub _stub = new com.technolabssoftware.www.StockReturnServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getStockReturnServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setStockReturnServiceImplPortEndpointAddress(java.lang.String address) {
        StockReturnServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.StockReturnService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.StockReturnServiceSoapBindingStub _stub = new com.technolabssoftware.www.StockReturnServiceSoapBindingStub(new java.net.URL(StockReturnServiceImplPort_address), this);
                _stub.setPortName(getStockReturnServiceImplPortWSDDServiceName());
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
        if ("StockReturnServiceImplPort".equals(inputPortName)) {
            return getStockReturnServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "StockReturnService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "StockReturnServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("StockReturnServiceImplPort".equals(portName)) {
            setStockReturnServiceImplPortEndpointAddress(address);
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
