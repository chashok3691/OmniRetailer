/**
 * OrderShipmentService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class OrderShipmentService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.OrderShipmentService_Service {

    public OrderShipmentService_ServiceLocator() {
    }


    public OrderShipmentService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public OrderShipmentService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for OrderShipmentServiceImplPort
    private java.lang.String OrderShipmentServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/OrderShipmentService";

    public java.lang.String getOrderShipmentServiceImplPortAddress() {
        return OrderShipmentServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String OrderShipmentServiceImplPortWSDDServiceName = "OrderShipmentServiceImplPort";

    public java.lang.String getOrderShipmentServiceImplPortWSDDServiceName() {
        return OrderShipmentServiceImplPortWSDDServiceName;
    }

    public void setOrderShipmentServiceImplPortWSDDServiceName(java.lang.String name) {
        OrderShipmentServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.OrderShipmentService_PortType getOrderShipmentServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(OrderShipmentServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getOrderShipmentServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.OrderShipmentService_PortType getOrderShipmentServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.OrderShipmentServiceSoapBindingStub _stub = new com.technolabssoftware.www.OrderShipmentServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getOrderShipmentServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setOrderShipmentServiceImplPortEndpointAddress(java.lang.String address) {
        OrderShipmentServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.OrderShipmentService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.OrderShipmentServiceSoapBindingStub _stub = new com.technolabssoftware.www.OrderShipmentServiceSoapBindingStub(new java.net.URL(OrderShipmentServiceImplPort_address), this);
                _stub.setPortName(getOrderShipmentServiceImplPortWSDDServiceName());
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
        if ("OrderShipmentServiceImplPort".equals(inputPortName)) {
            return getOrderShipmentServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "OrderShipmentService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "OrderShipmentServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("OrderShipmentServiceImplPort".equals(portName)) {
            setOrderShipmentServiceImplPortEndpointAddress(address);
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
