/**
 * StockRequests_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface StockRequests_PortType extends java.rmi.Remote {
    public java.lang.String createStockRequest(java.lang.String stockRequestDetails) throws java.rmi.RemoteException;
    public java.lang.String updateStockRequest(java.lang.String stockRequestDetails) throws java.rmi.RemoteException;
    public java.lang.String getStockRequests(java.lang.String stockRequestDetails) throws java.rmi.RemoteException;
}
