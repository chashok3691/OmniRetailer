/**
 * GiftVoucherServicesLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class GiftVoucherServicesLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.GiftVoucherServices {

    public GiftVoucherServicesLocator() {
    }


    public GiftVoucherServicesLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public GiftVoucherServicesLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for GiftVouchersImplPort
    private java.lang.String GiftVouchersImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/GiftVoucherServices";

    public java.lang.String getGiftVouchersImplPortAddress() {
        return GiftVouchersImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String GiftVouchersImplPortWSDDServiceName = "GiftVouchersImplPort";

    public java.lang.String getGiftVouchersImplPortWSDDServiceName() {
        return GiftVouchersImplPortWSDDServiceName;
    }

    public void setGiftVouchersImplPortWSDDServiceName(java.lang.String name) {
        GiftVouchersImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.GiftVouchers getGiftVouchersImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(GiftVouchersImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getGiftVouchersImplPort(endpoint);
    }

    public com.technolabssoftware.www.GiftVouchers getGiftVouchersImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.GiftVoucherServicesSoapBindingStub _stub = new com.technolabssoftware.www.GiftVoucherServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getGiftVouchersImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setGiftVouchersImplPortEndpointAddress(java.lang.String address) {
        GiftVouchersImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.GiftVouchers.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.GiftVoucherServicesSoapBindingStub _stub = new com.technolabssoftware.www.GiftVoucherServicesSoapBindingStub(new java.net.URL(GiftVouchersImplPort_address), this);
                _stub.setPortName(getGiftVouchersImplPortWSDDServiceName());
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
        if ("GiftVouchersImplPort".equals(inputPortName)) {
            return getGiftVouchersImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "GiftVoucherServices");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "GiftVouchersImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("GiftVouchersImplPort".equals(portName)) {
            setGiftVouchersImplPortEndpointAddress(address);
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
