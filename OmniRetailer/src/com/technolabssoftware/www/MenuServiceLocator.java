/**
 * MenuServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class MenuServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.MenuService {

    public MenuServiceLocator() {
    }


    public MenuServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public MenuServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for MenuImplPort
    private java.lang.String MenuImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/menu";

    public java.lang.String getMenuImplPortAddress() {
        return MenuImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String MenuImplPortWSDDServiceName = "MenuImplPort";

    public java.lang.String getMenuImplPortWSDDServiceName() {
        return MenuImplPortWSDDServiceName;
    }

    public void setMenuImplPortWSDDServiceName(java.lang.String name) {
        MenuImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.Menu getMenuImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(MenuImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getMenuImplPort(endpoint);
    }

    public com.technolabssoftware.www.Menu getMenuImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.MenuServiceSoapBindingStub _stub = new com.technolabssoftware.www.MenuServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getMenuImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setMenuImplPortEndpointAddress(java.lang.String address) {
        MenuImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.Menu.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.MenuServiceSoapBindingStub _stub = new com.technolabssoftware.www.MenuServiceSoapBindingStub(new java.net.URL(MenuImplPort_address), this);
                _stub.setPortName(getMenuImplPortWSDDServiceName());
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
        if ("MenuImplPort".equals(inputPortName)) {
            return getMenuImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "MenuService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "MenuImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("MenuImplPort".equals(portName)) {
            setMenuImplPortEndpointAddress(address);
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
