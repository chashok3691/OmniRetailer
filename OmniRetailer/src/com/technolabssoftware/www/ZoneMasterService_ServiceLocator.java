/**
 * ZoneMasterService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class ZoneMasterService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.ZoneMasterService_Service {

    public ZoneMasterService_ServiceLocator() {
    }


    public ZoneMasterService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ZoneMasterService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for ZoneMasterServiceImplPort
    private java.lang.String ZoneMasterServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/ZoneMasterService";

    public java.lang.String getZoneMasterServiceImplPortAddress() {
        return ZoneMasterServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String ZoneMasterServiceImplPortWSDDServiceName = "ZoneMasterServiceImplPort";

    public java.lang.String getZoneMasterServiceImplPortWSDDServiceName() {
        return ZoneMasterServiceImplPortWSDDServiceName;
    }

    public void setZoneMasterServiceImplPortWSDDServiceName(java.lang.String name) {
        ZoneMasterServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.ZoneMasterService_PortType getZoneMasterServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ZoneMasterServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getZoneMasterServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.ZoneMasterService_PortType getZoneMasterServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.ZoneMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.ZoneMasterServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getZoneMasterServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setZoneMasterServiceImplPortEndpointAddress(java.lang.String address) {
        ZoneMasterServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.ZoneMasterService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.ZoneMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.ZoneMasterServiceSoapBindingStub(new java.net.URL(ZoneMasterServiceImplPort_address), this);
                _stub.setPortName(getZoneMasterServiceImplPortWSDDServiceName());
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
        if ("ZoneMasterServiceImplPort".equals(inputPortName)) {
            return getZoneMasterServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "ZoneMasterService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "ZoneMasterServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ZoneMasterServiceImplPort".equals(portName)) {
            setZoneMasterServiceImplPortEndpointAddress(address);
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
