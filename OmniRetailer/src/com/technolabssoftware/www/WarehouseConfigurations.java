/**
 * WarehouseConfigurations.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface WarehouseConfigurations extends java.rmi.Remote {
    public java.lang.String updateWarehouseStorageSystems(java.lang.String storageSystemsDetails) throws java.rmi.RemoteException;
    public java.lang.String getWarehouseDetails(java.lang.String warehouseDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteWarehouses(java.lang.String warehouseDetails) throws java.rmi.RemoteException;
    public java.lang.String getWarehouses(java.lang.String warehouseDetails) throws java.rmi.RemoteException;
    public java.lang.String createWarehouse(java.lang.String warehouseDetails) throws java.rmi.RemoteException;
    public java.lang.String updateWarehouse(java.lang.String warehouseDetails) throws java.rmi.RemoteException;
}
