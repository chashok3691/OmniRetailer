/**
 * WHOrders.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface WHOrders extends java.rmi.Remote {
    public java.lang.String getOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String createOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String updateOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String getOrders(java.lang.String orderDetails) throws java.rmi.RemoteException;
}
