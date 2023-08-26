/**
 * StoreStockVerification.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface StoreStockVerification extends java.rmi.Remote {
    public java.lang.String getStorageUnit(java.lang.String store_location) throws java.rmi.RemoteException;
    public java.lang.String getProductVerification(java.lang.String getProductVerificationRequest) throws java.rmi.RemoteException;
    public java.lang.String getRawMaterialVerification(java.lang.String getVerificationRequest) throws java.rmi.RemoteException;
    public java.lang.String getSkuDetails(java.lang.String productId) throws java.rmi.RemoteException;
    public java.lang.String getRawMaterials(java.lang.String productId) throws java.rmi.RemoteException;
    public java.lang.String updateRawMaterial(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException;
    public java.lang.String getProductVerificationDetails(java.lang.String getProductVerificationDetailsRequest) throws java.rmi.RemoteException;
    public java.lang.String createStock(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException;
    public java.lang.String getStorageLocation(java.lang.String storage_unit) throws java.rmi.RemoteException;
    public java.lang.String getRawMaterialVerificationDetails(java.lang.String getVerificationDetailsRequest) throws java.rmi.RemoteException;
    public java.lang.String updateStock(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException;
}
