/**
 * GiftCouponServicesLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class GiftCouponServicesLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.GiftCouponServices {

    public GiftCouponServicesLocator() {
    }


    public GiftCouponServicesLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public GiftCouponServicesLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for GiftCouponsImplPort
    private java.lang.String GiftCouponsImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/GiftCouponServices";

    public java.lang.String getGiftCouponsImplPortAddress() {
        return GiftCouponsImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String GiftCouponsImplPortWSDDServiceName = "GiftCouponsImplPort";

    public java.lang.String getGiftCouponsImplPortWSDDServiceName() {
        return GiftCouponsImplPortWSDDServiceName;
    }

    public void setGiftCouponsImplPortWSDDServiceName(java.lang.String name) {
        GiftCouponsImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.GiftCoupons getGiftCouponsImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(GiftCouponsImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getGiftCouponsImplPort(endpoint);
    }

    public com.technolabssoftware.www.GiftCoupons getGiftCouponsImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.GiftCouponServicesSoapBindingStub _stub = new com.technolabssoftware.www.GiftCouponServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getGiftCouponsImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setGiftCouponsImplPortEndpointAddress(java.lang.String address) {
        GiftCouponsImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.GiftCoupons.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.GiftCouponServicesSoapBindingStub _stub = new com.technolabssoftware.www.GiftCouponServicesSoapBindingStub(new java.net.URL(GiftCouponsImplPort_address), this);
                _stub.setPortName(getGiftCouponsImplPortWSDDServiceName());
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
        if ("GiftCouponsImplPort".equals(inputPortName)) {
            return getGiftCouponsImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "GiftCouponServices");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "GiftCouponsImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("GiftCouponsImplPort".equals(portName)) {
            setGiftCouponsImplPortEndpointAddress(address);
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
