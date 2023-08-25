/**
 * AssetMasterService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class AssetMasterService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.AssetMasterService_Service {

    public AssetMasterService_ServiceLocator() {
    }


    public AssetMasterService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public AssetMasterService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for AssetMasterServiceImplPort
    private java.lang.String AssetMasterServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/AssetMasterService";

    public java.lang.String getAssetMasterServiceImplPortAddress() {
        return AssetMasterServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String AssetMasterServiceImplPortWSDDServiceName = "AssetMasterServiceImplPort";

    public java.lang.String getAssetMasterServiceImplPortWSDDServiceName() {
        return AssetMasterServiceImplPortWSDDServiceName;
    }

    public void setAssetMasterServiceImplPortWSDDServiceName(java.lang.String name) {
        AssetMasterServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.AssetMasterService_PortType getAssetMasterServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(AssetMasterServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getAssetMasterServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.AssetMasterService_PortType getAssetMasterServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.AssetMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.AssetMasterServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getAssetMasterServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setAssetMasterServiceImplPortEndpointAddress(java.lang.String address) {
        AssetMasterServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.AssetMasterService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.AssetMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.AssetMasterServiceSoapBindingStub(new java.net.URL(AssetMasterServiceImplPort_address), this);
                _stub.setPortName(getAssetMasterServiceImplPortWSDDServiceName());
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
        if ("AssetMasterServiceImplPort".equals(inputPortName)) {
            return getAssetMasterServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "AssetMasterService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "AssetMasterServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("AssetMasterServiceImplPort".equals(portName)) {
            setAssetMasterServiceImplPortEndpointAddress(address);
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
