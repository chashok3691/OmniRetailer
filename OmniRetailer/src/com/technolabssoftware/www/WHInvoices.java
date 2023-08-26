/**
 * WHInvoices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface WHInvoices extends java.rmi.Remote {
    public java.lang.String getInvoices(java.lang.String invoiceDetails) throws java.rmi.RemoteException;
    public java.lang.String updateInvoice(java.lang.String invoiceDetails) throws java.rmi.RemoteException;
    public java.lang.String createInvoice(java.lang.String invoiceDetails) throws java.rmi.RemoteException;
    public java.lang.String getInvoiceDetails(java.lang.String invoiceDetails) throws java.rmi.RemoteException;
}
