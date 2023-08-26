/**
 * BrandMasterService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class BrandMasterService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.BrandMasterService_Service {

    public BrandMasterService_ServiceLocator() {
    }


    public BrandMasterService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public BrandMasterService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BrandMasterServiceImplPort
    private java.lang.String BrandMasterServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/BrandMasterService";

    public java.lang.String getBrandMasterServiceImplPortAddress() {
        return BrandMasterServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BrandMasterServiceImplPortWSDDServiceName = "BrandMasterServiceImplPort";

    public java.lang.String getBrandMasterServiceImplPortWSDDServiceName() {
        return BrandMasterServiceImplPortWSDDServiceName;
    }

    public void setBrandMasterServiceImplPortWSDDServiceName(java.lang.String name) {
        BrandMasterServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.BrandMasterService_PortType getBrandMasterServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BrandMasterServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBrandMasterServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.BrandMasterService_PortType getBrandMasterServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.BrandMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.BrandMasterServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getBrandMasterServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBrandMasterServiceImplPortEndpointAddress(java.lang.String address) {
        BrandMasterServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.BrandMasterService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.BrandMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.BrandMasterServiceSoapBindingStub(new java.net.URL(BrandMasterServiceImplPort_address), this);
                _stub.setPortName(getBrandMasterServiceImplPortWSDDServiceName());
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
        if ("BrandMasterServiceImplPort".equals(inputPortName)) {
            return getBrandMasterServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "BrandMasterService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "BrandMasterServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BrandMasterServiceImplPort".equals(portName)) {
            setBrandMasterServiceImplPortEndpointAddress(address);
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
