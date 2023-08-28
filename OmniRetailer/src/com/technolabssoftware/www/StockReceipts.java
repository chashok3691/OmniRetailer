/**
 * StockReceipts.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface StockReceipts extends java.rmi.Remote {
    public java.lang.String createNewStockProcurementReceipt(java.lang.String procurement_details) throws java.rmi.RemoteException;
    public java.lang.String getStockReceiptIds(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getStockProcurementReceipts(java.lang.String start) throws java.rmi.RemoteException;
    public java.lang.String updateStockReciept(java.lang.String stockRecieptDetails) throws java.rmi.RemoteException;
    public java.lang.String searchStockProcurementReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String searchStockReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getStockProcurementReceipt(java.lang.String receiptId) throws java.rmi.RemoteException;
    public java.lang.String getStockReceipts(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String createStockReciept(java.lang.String stockRecieptDetails) throws java.rmi.RemoteException;
    public java.lang.String getStockProcurementReceiptIds(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getStockReceipt(java.lang.String receiptID) throws java.rmi.RemoteException;
}
