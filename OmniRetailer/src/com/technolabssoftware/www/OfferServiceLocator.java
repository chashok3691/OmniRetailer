/**
 * OfferServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class OfferServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.OfferService {

    public OfferServiceLocator() {
    }


    public OfferServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public OfferServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for OfferImplPort
    private java.lang.String OfferImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"//OfferServices";

    public java.lang.String getOfferImplPortAddress() {
        return OfferImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String OfferImplPortWSDDServiceName = "OfferImplPort";

    public java.lang.String getOfferImplPortWSDDServiceName() {
        return OfferImplPortWSDDServiceName;
    }

    public void setOfferImplPortWSDDServiceName(java.lang.String name) {
        OfferImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.Offer getOfferImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(OfferImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getOfferImplPort(endpoint);
    }

    public com.technolabssoftware.www.Offer getOfferImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.OfferServiceSoapBindingStub _stub = new com.technolabssoftware.www.OfferServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getOfferImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setOfferImplPortEndpointAddress(java.lang.String address) {
        OfferImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.Offer.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.OfferServiceSoapBindingStub _stub = new com.technolabssoftware.www.OfferServiceSoapBindingStub(new java.net.URL(OfferImplPort_address), this);
                _stub.setPortName(getOfferImplPortWSDDServiceName());
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
        if ("OfferImplPort".equals(inputPortName)) {
            return getOfferImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "OfferService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "OfferImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("OfferImplPort".equals(portName)) {
            setOfferImplPortEndpointAddress(address);
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
