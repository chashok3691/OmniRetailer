/**
 * Orders.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Orders extends java.rmi.Remote {
    public java.lang.String updateOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String searchOrders(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getOrders(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String getOrderDetails(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String createOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
    public java.lang.String getCustomerOrders(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String getOrdersSummary(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String cancelOrder(java.lang.String orderDetails) throws java.rmi.RemoteException;
}
