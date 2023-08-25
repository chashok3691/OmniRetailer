/**
 * ProductMasterServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class ProductMasterServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.ProductMasterService {

    public ProductMasterServiceLocator() {
    }


    public ProductMasterServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public ProductMasterServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for ProductMasterImplPort
    private java.lang.String ProductMasterImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/ProductMasterServices";

    public java.lang.String getProductMasterImplPortAddress() {
        return ProductMasterImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String ProductMasterImplPortWSDDServiceName = "ProductMasterImplPort";

    public java.lang.String getProductMasterImplPortWSDDServiceName() {
        return ProductMasterImplPortWSDDServiceName;
    }

    public void setProductMasterImplPortWSDDServiceName(java.lang.String name) {
        ProductMasterImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.ProductMaster getProductMasterImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ProductMasterImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getProductMasterImplPort(endpoint);
    }

    public com.technolabssoftware.www.ProductMaster getProductMasterImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.ProductMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.ProductMasterServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getProductMasterImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setProductMasterImplPortEndpointAddress(java.lang.String address) {
        ProductMasterImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.ProductMaster.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.ProductMasterServiceSoapBindingStub _stub = new com.technolabssoftware.www.ProductMasterServiceSoapBindingStub(new java.net.URL(ProductMasterImplPort_address), this);
                _stub.setPortName(getProductMasterImplPortWSDDServiceName());
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
        if ("ProductMasterImplPort".equals(inputPortName)) {
            return getProductMasterImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "ProductMasterService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "ProductMasterImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ProductMasterImplPort".equals(portName)) {
            setProductMasterImplPortEndpointAddress(address);
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
