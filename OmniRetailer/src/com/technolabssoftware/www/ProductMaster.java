/**
 * ProductMaster.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface ProductMaster extends java.rmi.Remote {
    public java.lang.String deleteProducts(java.lang.String productIds) throws java.rmi.RemoteException;
    public java.lang.String updateProduct(java.lang.String productDetails) throws java.rmi.RemoteException;
    public java.lang.String getProducts(java.lang.String productMasterSearchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getProductDetails(java.lang.String productIds) throws java.rmi.RemoteException;
    public java.lang.String createProduct(java.lang.String productDetails) throws java.rmi.RemoteException;
}
