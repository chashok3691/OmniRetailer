/**
 * StoreService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface StoreService_PortType extends java.rmi.Remote {
    public java.lang.String createLayout(java.lang.String layoutDetails) throws java.rmi.RemoteException;
    public java.lang.String getAllLayoutTables(java.lang.String layoutDetails) throws java.rmi.RemoteException;
    public java.lang.String getBillingCounters(java.lang.String counterdetails) throws java.rmi.RemoteException;
    public java.lang.String editLayout(java.lang.String layoutDetails) throws java.rmi.RemoteException;
    public java.lang.String createOutletSettings(java.lang.String outletSettings) throws java.rmi.RemoteException;
    public java.lang.String updateStore(java.lang.String layoutDetails) throws java.rmi.RemoteException;
    public java.lang.String getStores(java.lang.String layoutDetails) throws java.rmi.RemoteException;
    public java.lang.String getLayout(java.lang.String layoutDetails) throws java.rmi.RemoteException;
    public java.lang.String createStore(java.lang.String storeDetails) throws java.rmi.RemoteException;
}
