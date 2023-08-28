/**
 * MemberServicesLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class MemberServicesLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.MemberServices {

    public MemberServicesLocator() {
    }


    public MemberServicesLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public MemberServicesLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for MemberServiceImplPort
    private java.lang.String MemberServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/memberServices";

    public java.lang.String getMemberServiceImplPortAddress() {
        return MemberServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String MemberServiceImplPortWSDDServiceName = "MemberServiceImplPort";

    public java.lang.String getMemberServiceImplPortWSDDServiceName() {
        return MemberServiceImplPortWSDDServiceName;
    }

    public void setMemberServiceImplPortWSDDServiceName(java.lang.String name) {
        MemberServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.MemberService getMemberServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(MemberServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getMemberServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.MemberService getMemberServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.MemberServicesSoapBindingStub _stub = new com.technolabssoftware.www.MemberServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getMemberServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setMemberServiceImplPortEndpointAddress(java.lang.String address) {
        MemberServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.MemberService.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.MemberServicesSoapBindingStub _stub = new com.technolabssoftware.www.MemberServicesSoapBindingStub(new java.net.URL(MemberServiceImplPort_address), this);
                _stub.setPortName(getMemberServiceImplPortWSDDServiceName());
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
        if ("MemberServiceImplPort".equals(inputPortName)) {
            return getMemberServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "memberServices");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "MemberServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("MemberServiceImplPort".equals(portName)) {
            setMemberServiceImplPortEndpointAddress(address);
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
