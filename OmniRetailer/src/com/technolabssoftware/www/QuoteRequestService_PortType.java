/**
 * QuoteRequestService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface QuoteRequestService_PortType extends java.rmi.Remote {
    public java.lang.String getQuoteRequests(java.lang.String getDetails) throws java.rmi.RemoteException;
    public java.lang.String createRequestForQuote(java.lang.String createDetails) throws java.rmi.RemoteException;
    public java.lang.String updateRequestForQuote(java.lang.String updateDetais) throws java.rmi.RemoteException;
}
