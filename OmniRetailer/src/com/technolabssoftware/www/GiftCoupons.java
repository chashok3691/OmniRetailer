/**
 * GiftCoupons.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface GiftCoupons extends java.rmi.Remote {
    public java.lang.String getGiftCouponsMaster(java.lang.String giftCouponDetails) throws java.rmi.RemoteException;
    public java.lang.String getGiftCoupons(java.lang.String getGiftCouponsRequest) throws java.rmi.RemoteException;
    public java.lang.String getCouponDetails(java.lang.String couponDetails) throws java.rmi.RemoteException;
    public java.lang.String createGiftCoupons(java.lang.String giftCouponDetails) throws java.rmi.RemoteException;
}
