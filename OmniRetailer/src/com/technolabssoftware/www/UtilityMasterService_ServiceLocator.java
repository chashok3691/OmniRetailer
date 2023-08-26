/**
 * UtilityMasterService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class UtilityMasterService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.UtilityMasterService_Service {

    public UtilityMasterService_ServiceLocator() {
    }


    public UtilityMasterService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public UtilityMasterService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for UtilityMasterImplPort
    private java.lang.String UtilityMasterImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/utilityMasterServices";

    public java.lang.String getUtilityMasterImplPortAddress() {
        return UtilityMasterImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String UtilityMasterImplPortWSDDServiceName = "UtilityMasterImplPort";

    public java.lang.String getUtilityMasterImplPortWSDDServiceName() {
        return UtilityMasterImplPortWSDDServiceName;
    }

    public void setUtilityMasterImplPortWSDDServiceName(java.lang.String name) {
        UtilityMasterImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.UtilityMasterService_PortType getUtilityMasterImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(UtilityMasterImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getUtilityMasterImplPort(endpoint);
    }

    public com.technolabssoftware.www.UtilityMasterService_PortType getUtilityMasterImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.UtilityMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.UtilityMasterServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getUtilityMasterImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setUtilityMasterImplPortEndpointAddress(java.lang.String address) {
        UtilityMasterImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.UtilityMasterService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.UtilityMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.UtilityMasterServiceSoapBindingStub(new java.net.URL(UtilityMasterImplPort_address), this);
                _stub.setPortName(getUtilityMasterImplPortWSDDServiceName());
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
        if ("UtilityMasterImplPort".equals(inputPortName)) {
            return getUtilityMasterImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "UtilityMasterService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "UtilityMasterImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("UtilityMasterImplPort".equals(portName)) {
            setUtilityMasterImplPortEndpointAddress(address);
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
