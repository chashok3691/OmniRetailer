/**
 * StockIssues.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface StockIssues extends java.rmi.Remote {
    public java.lang.String getStockIssueIds(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getStockIssue(java.lang.String issueID) throws java.rmi.RemoteException;
    public java.lang.String createStockIssue(java.lang.String stockIssueDetails) throws java.rmi.RemoteException;
    public java.lang.String getStockIssues(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String updateStockIssue(java.lang.String stockIssueDetails) throws java.rmi.RemoteException;
}
