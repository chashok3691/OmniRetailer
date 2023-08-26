/**
 * AppSettings_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class AppSettings_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.AppSettings_Service {

    public AppSettings_ServiceLocator() {
    }


    public AppSettings_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public AppSettings_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for AppSettingsImplPort
    private java.lang.String AppSettingsImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/appSettings";

    public java.lang.String getAppSettingsImplPortAddress() {
        return AppSettingsImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String AppSettingsImplPortWSDDServiceName = "AppSettingsImplPort";

    public java.lang.String getAppSettingsImplPortWSDDServiceName() {
        return AppSettingsImplPortWSDDServiceName;
    }

    public void setAppSettingsImplPortWSDDServiceName(java.lang.String name) {
        AppSettingsImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.AppSettings_PortType getAppSettingsImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(AppSettingsImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getAppSettingsImplPort(endpoint);
    }

    public com.technolabssoftware.www.AppSettings_PortType getAppSettingsImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.AppSettingsSoapBindingStub _stub = new com.technolabssoftware.www.AppSettingsSoapBindingStub(portAddress, this);
            _stub.setPortName(getAppSettingsImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setAppSettingsImplPortEndpointAddress(java.lang.String address) {
        AppSettingsImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.AppSettings_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.AppSettingsSoapBindingStub _stub = new com.technolabssoftware.www.AppSettingsSoapBindingStub(new java.net.URL(AppSettingsImplPort_address), this);
                _stub.setPortName(getAppSettingsImplPortWSDDServiceName());
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
        if ("AppSettingsImplPort".equals(inputPortName)) {
            return getAppSettingsImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "AppSettings");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "AppSettingsImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("AppSettingsImplPort".equals(portName)) {
            setAppSettingsImplPortEndpointAddress(address);
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
