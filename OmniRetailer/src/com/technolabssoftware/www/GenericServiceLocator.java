/**
 * GenericServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class GenericServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.GenericService {

    public GenericServiceLocator() {
    }


    public GenericServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public GenericServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for GenericServiceImplPort
    private java.lang.String GenericServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/GenericService";

    public java.lang.String getGenericServiceImplPortAddress() {
        return GenericServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String GenericServiceImplPortWSDDServiceName = "GenericServiceImplPort";

    public java.lang.String getGenericServiceImplPortWSDDServiceName() {
        return GenericServiceImplPortWSDDServiceName;
    }

    public void setGenericServiceImplPortWSDDServiceName(java.lang.String name) {
        GenericServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.GenericSettingService getGenericServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(GenericServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getGenericServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.GenericSettingService getGenericServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.GenericServiceSoapBindingStub _stub = new com.technolabssoftware.www.GenericServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getGenericServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setGenericServiceImplPortEndpointAddress(java.lang.String address) {
        GenericServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.GenericSettingService.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.GenericServiceSoapBindingStub _stub = new com.technolabssoftware.www.GenericServiceSoapBindingStub(new java.net.URL(GenericServiceImplPort_address), this);
                _stub.setPortName(getGenericServiceImplPortWSDDServiceName());
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
        if ("GenericServiceImplPort".equals(inputPortName)) {
            return getGenericServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "GenericService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "GenericServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("GenericServiceImplPort".equals(portName)) {
            setGenericServiceImplPortEndpointAddress(address);
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
