/**
 * GiftVouchers.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface GiftVouchers extends java.rmi.Remote {
    public java.lang.String createGiftVouchers(java.lang.String giftVoucherDetails) throws java.rmi.RemoteException;
    public java.lang.String issueVoucherToCustomer(java.lang.String createIssueDetails) throws java.rmi.RemoteException;
    public java.lang.String getGiftVouchers(java.lang.String giftVoucherDetails) throws java.rmi.RemoteException;
    public java.lang.String getAvailableVouchers(java.lang.String getVoucherDetails) throws java.rmi.RemoteException;
    public java.lang.String getGiftVoucherDetails(java.lang.String giftVoucherDetails) throws java.rmi.RemoteException;
}
