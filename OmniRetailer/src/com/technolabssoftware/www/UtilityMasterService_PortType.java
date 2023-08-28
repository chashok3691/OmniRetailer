/**
 * UtilityMasterService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface UtilityMasterService_PortType extends java.rmi.Remote {
    public java.lang.String updateTaxDetails(java.lang.String taxDetails) throws java.rmi.RemoteException;
    public java.lang.String createLocation(java.lang.String locationDetails) throws java.rmi.RemoteException;
    public java.lang.String getLocation(java.lang.String locationDetails) throws java.rmi.RemoteException;
    public java.lang.String createTax(java.lang.String taxDetails) throws java.rmi.RemoteException;
    public java.lang.String getProductSubCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String getCustomerDevices(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String updateCurrency(java.lang.String currency) throws java.rmi.RemoteException;
    public java.lang.String createProductSubCategory(java.lang.String productSubCategoryDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteProductSubCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String getLanguages(java.lang.String language) throws java.rmi.RemoteException;
    public java.lang.String updateLocation(java.lang.String locationDetails) throws java.rmi.RemoteException;
    public java.lang.String getTaxes(java.lang.String userId) throws java.rmi.RemoteException;
    public java.lang.String getCurrency(java.lang.String currency) throws java.rmi.RemoteException;
    public java.lang.String getWareHouses(java.lang.String wareHouse) throws java.rmi.RemoteException;
    public java.lang.String createProductCategory(java.lang.String productCategoryDetails) throws java.rmi.RemoteException;
    public java.lang.String getProductCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteProductCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteCurrency(java.lang.String currency) throws java.rmi.RemoteException;
    public java.lang.String getCategories(java.lang.String userId) throws java.rmi.RemoteException;
    public java.lang.String updateProductCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String updateProductSubCategory(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteTaxDetails(java.lang.String taxDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteLocation(java.lang.String locationDetails) throws java.rmi.RemoteException;
    public java.lang.String createCurrency(java.lang.String currencyDetails) throws java.rmi.RemoteException;
}
