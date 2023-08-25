/**
 * StockReceiptServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

import com.tlabs.posweb.init.AppProperties;

public class StockReceiptServiceLocator extends org.apache.axis.client.Service implements com.technolabssoftware.www.StockReceiptService {

    public StockReceiptServiceLocator() {
    }


    public StockReceiptServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public StockReceiptServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for StockReceiptsImplPort
    private java.lang.String StockReceiptsImplPort_address = AppProperties.getCloudServiceUrlWithContext()+"/StockReceiptService";

    public java.lang.String getStockReceiptsImplPortAddress() {
        return StockReceiptsImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String StockReceiptsImplPortWSDDServiceName = "StockReceiptsImplPort";

    public java.lang.String getStockReceiptsImplPortWSDDServiceName() {
        return StockReceiptsImplPortWSDDServiceName;
    }

    public void setStockReceiptsImplPortWSDDServiceName(java.lang.String name) {
        StockReceiptsImplPortWSDDServiceName = name;
    }

    public com.technolabssoftware.www.StockReceipts getStockReceiptsImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(StockReceiptsImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getStockReceiptsImplPort(endpoint);
    }

    public com.technolabssoftware.www.StockReceipts getStockReceiptsImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.technolabssoftware.www.StockReceiptServiceSoapBindingStub _stub = new com.technolabssoftware.www.StockReceiptServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getStockReceiptsImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setStockReceiptsImplPortEndpointAddress(java.lang.String address) {
        StockReceiptsImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.technolabssoftware.www.StockReceipts.class.isAssignableFrom(serviceEndpointInterface)) {
                com.technolabssoftware.www.StockReceiptServiceSoapBindingStub _stub = new com.technolabssoftware.www.StockReceiptServiceSoapBindingStub(new java.net.URL(StockReceiptsImplPort_address), this);
                _stub.setPortName(getStockReceiptsImplPortWSDDServiceName());
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
        if ("StockReceiptsImplPort".equals(inputPortName)) {
            return getStockReceiptsImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("www.technolabssoftware.com", "StockReceiptService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("www.technolabssoftware.com", "StockReceiptsImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("StockReceiptsImplPort".equals(portName)) {
            setStockReceiptsImplPortEndpointAddress(address);
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
