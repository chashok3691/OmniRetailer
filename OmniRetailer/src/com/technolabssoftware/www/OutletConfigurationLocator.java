/**
 * OutletConfigurationLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class OutletConfigurationLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.OutletConfiguration {

    public OutletConfigurationLocator() {
    }


    public OutletConfigurationLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public OutletConfigurationLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for OutletConfigurationsImplPort
    private java.lang.String OutletConfigurationsImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/outletConfiguration";

    public java.lang.String getOutletConfigurationsImplPortAddress() {
        return OutletConfigurationsImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String OutletConfigurationsImplPortWSDDServiceName = "OutletConfigurationsImplPort";

    public java.lang.String getOutletConfigurationsImplPortWSDDServiceName() {
        return OutletConfigurationsImplPortWSDDServiceName;
    }

    public void setOutletConfigurationsImplPortWSDDServiceName(java.lang.String name) {
        OutletConfigurationsImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.OutletConfigurations getOutletConfigurationsImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(OutletConfigurationsImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getOutletConfigurationsImplPort(endpoint);
    }

    public com.technolabssoftware.www.OutletConfigurations getOutletConfigurationsImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.OutletConfigurationSoapBindingStub _stub = new com.technolabssoftware.www.OutletConfigurationSoapBindingStub(portAddress, this);
            _stub.setPortName(getOutletConfigurationsImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setOutletConfigurationsImplPortEndpointAddress(java.lang.String address) {
        OutletConfigurationsImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.OutletConfigurations.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.OutletConfigurationSoapBindingStub _stub = new com.technolabssoftware.www.OutletConfigurationSoapBindingStub(new java.net.URL(OutletConfigurationsImplPort_address), this);
                _stub.setPortName(getOutletConfigurationsImplPortWSDDServiceName());
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
        if ("OutletConfigurationsImplPort".equals(inputPortName)) {
            return getOutletConfigurationsImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "outletConfiguration");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "OutletConfigurationsImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("OutletConfigurationsImplPort".equals(portName)) {
            setOutletConfigurationsImplPortEndpointAddress(address);
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
