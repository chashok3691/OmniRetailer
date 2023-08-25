/**
 * Loyaltycard.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Loyaltycard extends java.rmi.Remote {
    public java.lang.String getloyaltyCardNumber(java.lang.String requestHeader) throws java.rmi.RemoteException;
    public java.lang.String getLoyaltyCards(java.lang.String loyaltyCardDetails) throws java.rmi.RemoteException;
    public java.lang.String createLoyaltyCards(java.lang.String loyaltyCardDetails) throws java.rmi.RemoteException;
    public java.lang.String supplyLoyaltyCard(java.lang.String loyaltyCardDetails) throws java.rmi.RemoteException;
    public java.lang.String getloyaltyCardIds(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getissuedLoyaltycard(java.lang.String loyaltyCardNumber) throws java.rmi.RemoteException;
}
