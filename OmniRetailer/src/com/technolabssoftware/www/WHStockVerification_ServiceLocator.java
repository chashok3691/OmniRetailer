/**
 * WHStockVerification_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class WHStockVerification_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.WHStockVerification_Service {

    public WHStockVerification_ServiceLocator() {
    }


    public WHStockVerification_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public WHStockVerification_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for WarehouseStockVerificationImplPort
    private java.lang.String WarehouseStockVerificationImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/warehouseStockVerification";

    public java.lang.String getWarehouseStockVerificationImplPortAddress() {
        return WarehouseStockVerificationImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String WarehouseStockVerificationImplPortWSDDServiceName = "WarehouseStockVerificationImplPort";

    public java.lang.String getWarehouseStockVerificationImplPortWSDDServiceName() {
        return WarehouseStockVerificationImplPortWSDDServiceName;
    }

    public void setWarehouseStockVerificationImplPortWSDDServiceName(java.lang.String name) {
        WarehouseStockVerificationImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.WHStockVerification_PortType getWarehouseStockVerificationImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(WarehouseStockVerificationImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getWarehouseStockVerificationImplPort(endpoint);
    }

    public com.technolabssoftware.www.WHStockVerification_PortType getWarehouseStockVerificationImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.WHStockVerificationSoapBindingStub _stub = new com.technolabssoftware.www.WHStockVerificationSoapBindingStub(portAddress, this);
            _stub.setPortName(getWarehouseStockVerificationImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setWarehouseStockVerificationImplPortEndpointAddress(java.lang.String address) {
        WarehouseStockVerificationImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.WHStockVerification_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.WHStockVerificationSoapBindingStub _stub = new com.technolabssoftware.www.WHStockVerificationSoapBindingStub(new java.net.URL(WarehouseStockVerificationImplPort_address), this);
                _stub.setPortName(getWarehouseStockVerificationImplPortWSDDServiceName());
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
        if ("WarehouseStockVerificationImplPort".equals(inputPortName)) {
            return getWarehouseStockVerificationImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "WHStockVerification");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "WarehouseStockVerificationImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("WarehouseStockVerificationImplPort".equals(portName)) {
            setWarehouseStockVerificationImplPortEndpointAddress(address);
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
