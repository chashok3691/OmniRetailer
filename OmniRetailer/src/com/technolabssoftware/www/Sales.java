/**
 * Sales.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Sales extends java.rmi.Remote {
    public java.lang.String updateBilling(java.lang.String bill_details) throws java.rmi.RemoteException;
    public java.lang.String getBillsDetails(java.lang.String billDetails) throws java.rmi.RemoteException;
    public java.lang.String exchangingItem(java.lang.String exchanging_item_details) throws java.rmi.RemoteException;
    public java.lang.String getPendingBillsByPage(java.lang.String filterInfo) throws java.rmi.RemoteException;
    public java.lang.String getSalesReport(java.lang.String reportByDate) throws java.rmi.RemoteException;
    public java.lang.String getExistedSaleID(java.lang.String saleID) throws java.rmi.RemoteException;
    public java.lang.String getStockDetailsByStockType(java.lang.String stockType) throws java.rmi.RemoteException;
    public java.lang.String searchSalesReportWithPagination(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getHomeDeliveryBills(java.lang.String billDetails) throws java.rmi.RemoteException;
    public java.lang.String searchStockWithPagination(java.lang.String stockSearchInput) throws java.rmi.RemoteException;
    public java.lang.String getProcurementReport(java.lang.String report) throws java.rmi.RemoteException;
    public java.lang.String getXZreportDetails(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getSalesReports(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String returningItem(java.lang.String returning_item_details) throws java.rmi.RemoteException;
    public java.lang.String getXZreports(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getHourWiseReport(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getBills(java.lang.String searchCriteria) throws java.rmi.RemoteException;
    public java.lang.String getAvailableStock(java.lang.String requestHeader) throws java.rmi.RemoteException;
    public java.lang.String getBillingDetails(java.lang.String saleID) throws java.rmi.RemoteException;
}
