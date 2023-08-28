/**
 * OrderShipmentService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface OrderShipmentService_PortType extends java.rmi.Remote {
    public java.lang.String createShipment(java.lang.String shipmentDetails) throws java.rmi.RemoteException;
    public java.lang.String getShipments(java.lang.String shipmentDetails) throws java.rmi.RemoteException;
    public java.lang.String updateShipment(java.lang.String shipmentDetails) throws java.rmi.RemoteException;
}
