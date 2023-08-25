/**
 * CustomerComplaintService_ServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class CustomerComplaintService_ServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.CustomerComplaintService_Service {

    public CustomerComplaintService_ServiceLocator() {
    }


    public CustomerComplaintService_ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public CustomerComplaintService_ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for CustomerComplaintServiceImplPort
    private java.lang.String CustomerComplaintServiceImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/CustomerComplaintService";

    public java.lang.String getCustomerComplaintServiceImplPortAddress() {
        return CustomerComplaintServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String CustomerComplaintServiceImplPortWSDDServiceName = "CustomerComplaintServiceImplPort";

    public java.lang.String getCustomerComplaintServiceImplPortWSDDServiceName() {
        return CustomerComplaintServiceImplPortWSDDServiceName;
    }

    public void setCustomerComplaintServiceImplPortWSDDServiceName(java.lang.String name) {
        CustomerComplaintServiceImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.CustomerComplaintService_PortType getCustomerComplaintServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(CustomerComplaintServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getCustomerComplaintServiceImplPort(endpoint);
    }

    public com.technolabssoftware.www.CustomerComplaintService_PortType getCustomerComplaintServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.CustomerComplaintServiceSoapBindingStub _stub = new com.technolabssoftware.www.CustomerComplaintServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getCustomerComplaintServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setCustomerComplaintServiceImplPortEndpointAddress(java.lang.String address) {
        CustomerComplaintServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.CustomerComplaintService_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.CustomerComplaintServiceSoapBindingStub _stub = new com.technolabssoftware.www.CustomerComplaintServiceSoapBindingStub(new java.net.URL(CustomerComplaintServiceImplPort_address), this);
                _stub.setPortName(getCustomerComplaintServiceImplPortWSDDServiceName());
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
        if ("CustomerComplaintServiceImplPort".equals(inputPortName)) {
            return getCustomerComplaintServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "CustomerComplaintService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "CustomerComplaintServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("CustomerComplaintServiceImplPort".equals(portName)) {
            setCustomerComplaintServiceImplPortEndpointAddress(address);
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
