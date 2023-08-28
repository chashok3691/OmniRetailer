/**
 * LoyaltycardServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class LoyaltycardServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.LoyaltycardService {

    public LoyaltycardServiceLocator() {
    }


    public LoyaltycardServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public LoyaltycardServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for LoyaltycardImplPort
    private java.lang.String LoyaltycardImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/LoyaltycardServices";

    public java.lang.String getLoyaltycardImplPortAddress() {
        return LoyaltycardImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String LoyaltycardImplPortWSDDServiceName = "LoyaltycardImplPort";

    public java.lang.String getLoyaltycardImplPortWSDDServiceName() {
        return LoyaltycardImplPortWSDDServiceName;
    }

    public void setLoyaltycardImplPortWSDDServiceName(java.lang.String name) {
        LoyaltycardImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.Loyaltycard getLoyaltycardImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(LoyaltycardImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getLoyaltycardImplPort(endpoint);
    }

    public com.technolabssoftware.www.Loyaltycard getLoyaltycardImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.LoyaltycardServiceSoapBindingStub _stub = new com.technolabssoftware.www.LoyaltycardServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getLoyaltycardImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setLoyaltycardImplPortEndpointAddress(java.lang.String address) {
        LoyaltycardImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.Loyaltycard.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.LoyaltycardServiceSoapBindingStub _stub = new com.technolabssoftware.www.LoyaltycardServiceSoapBindingStub(new java.net.URL(LoyaltycardImplPort_address), this);
                _stub.setPortName(getLoyaltycardImplPortWSDDServiceName());
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
        if ("LoyaltycardImplPort".equals(inputPortName)) {
            return getLoyaltycardImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "LoyaltycardService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "LoyaltycardImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("LoyaltycardImplPort".equals(portName)) {
            setLoyaltycardImplPortEndpointAddress(address);
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
