/**
 * WHStockVerification_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface WHStockVerification_PortType extends java.rmi.Remote {
    public java.lang.String getStockVerificationDetails(java.lang.String getStockVerificationDetailsRequest) throws java.rmi.RemoteException;
    public java.lang.String getSkuDetails(java.lang.String productId) throws java.rmi.RemoteException;
    public java.lang.String updateStock(java.lang.String stockVerificationDetails) throws java.rmi.RemoteException;
    public java.lang.String getStockVerification(java.lang.String getStockVerificationRequest) throws java.rmi.RemoteException;
}
