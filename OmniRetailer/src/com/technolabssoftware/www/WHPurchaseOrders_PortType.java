/**
 * WHPurchaseOrders_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface WHPurchaseOrders_PortType extends java.rmi.Remote {
    public java.lang.String getPurchaseOrders(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String deletePurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String createPurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String getPurchaseOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String updatePurchaseOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
}
