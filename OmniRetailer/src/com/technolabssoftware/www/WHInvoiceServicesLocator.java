/**
 * WHInvoiceServicesLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class WHInvoiceServicesLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.WHInvoiceServices {

    public WHInvoiceServicesLocator() {
    }


    public WHInvoiceServicesLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public WHInvoiceServicesLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for WHInvoicesImplPort
    private java.lang.String WHInvoicesImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/WHInvoiceServices";

    public java.lang.String getWHInvoicesImplPortAddress() {
        return WHInvoicesImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String WHInvoicesImplPortWSDDServiceName = "WHInvoicesImplPort";

    public java.lang.String getWHInvoicesImplPortWSDDServiceName() {
        return WHInvoicesImplPortWSDDServiceName;
    }

    public void setWHInvoicesImplPortWSDDServiceName(java.lang.String name) {
        WHInvoicesImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.WHInvoices getWHInvoicesImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(WHInvoicesImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getWHInvoicesImplPort(endpoint);
    }

    public com.technolabssoftware.www.WHInvoices getWHInvoicesImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.WHInvoiceServicesSoapBindingStub _stub = new com.technolabssoftware.www.WHInvoiceServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getWHInvoicesImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setWHInvoicesImplPortEndpointAddress(java.lang.String address) {
        WHInvoicesImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.WHInvoices.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.WHInvoiceServicesSoapBindingStub _stub = new com.technolabssoftware.www.WHInvoiceServicesSoapBindingStub(new java.net.URL(WHInvoicesImplPort_address), this);
                _stub.setPortName(getWHInvoicesImplPortWSDDServiceName());
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
        if ("WHInvoicesImplPort".equals(inputPortName)) {
            return getWHInvoicesImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "WHInvoiceServices");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "WHInvoicesImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("WHInvoicesImplPort".equals(portName)) {
            setWHInvoicesImplPortEndpointAddress(address);
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
