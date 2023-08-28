/**
 * ExportImports.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface ExportImports extends java.rmi.Remote {
    public java.lang.String uploadWarehouseSkuMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String uploadSkuEansUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String exportBills(java.lang.String fromDate) throws java.rmi.RemoteException;
    public java.lang.String exportStockReturns(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String importGroupMasterData(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String uploadSkuPriceUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String importStockReciept(java.lang.String request, java.lang.String file) throws java.rmi.RemoteException;
    public java.lang.String uploadSupplierMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String uploadSkuMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String exportStockIssues(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String exportStockReceipts(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String uploadProductMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String uploadDepartmentsUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String uploadSkuMasterUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String exportSkuMasterData(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String exportStockRequests(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String importEmployeeMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String exportBillings(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String uploadStockReceipt(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String importTemporaryGroup(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String uploadSkuPriceInfo(java.lang.String skuPrices, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
    public java.lang.String importBrandMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;
public java.lang.String uploadSupplierSkus(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;

public java.lang.String getExcelHeaderPositions(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException;





}
