/**
 * Offer.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Offer extends java.rmi.Remote {
    public java.lang.String searchOffers(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String updateOffer(java.lang.String offerDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteOffers(java.lang.String offerIDs) throws java.rmi.RemoteException;
    public java.lang.String getOffer(java.lang.String offerID) throws java.rmi.RemoteException;
    public java.lang.String createOffer(java.lang.String offerDetails) throws java.rmi.RemoteException;
    public java.lang.String addAttahmentInTemp(com.technolabssoftware.www.Attachment taskExecutionInput) throws java.rmi.RemoteException;
}
