/**
 * SupplierService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface SupplierService_PortType extends java.rmi.Remote {
    public java.lang.String getSuppliers(java.lang.String supplierDetails) throws java.rmi.RemoteException;
    public java.lang.String updateSupplier(java.lang.String supplierDetails) throws java.rmi.RemoteException;
    public java.lang.String createSupplier(java.lang.String supplierDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteSupplier(java.lang.String supplierDetails) throws java.rmi.RemoteException;
}
