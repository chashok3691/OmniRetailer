/**
 * Customer.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Customer extends java.rmi.Remote {
    public java.lang.String getBatchNamesByNotificationCategory(java.lang.String filters) throws java.rmi.RemoteException;
    public java.lang.String activateCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String updateCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String getCustomerVisits(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String registerCustomer(java.lang.String request) throws java.rmi.RemoteException;
    public java.lang.String resetCustomerPassword(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String getCustomerDetails(java.lang.String phone) throws java.rmi.RemoteException;
    public java.lang.String enableOrDisableBatches(java.lang.String filters) throws java.rmi.RemoteException;
    public java.lang.String forgetCustomerPassword(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String getCustomerList(java.lang.String filters) throws java.rmi.RemoteException;
    public java.lang.String notifyCustomers(java.lang.String filters) throws java.rmi.RemoteException;
    public java.lang.String authenticateCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String generateOtp(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String createBatch(java.lang.String filters) throws java.rmi.RemoteException;
    public java.lang.String getBatchInfo(java.lang.String filters) throws java.rmi.RemoteException;
    public java.lang.String createCustomer(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String changeCustomerPassword(java.lang.String customerDetails) throws java.rmi.RemoteException;
    public java.lang.String customerNotifications(java.lang.String notificationDetails) throws java.rmi.RemoteException;
}
