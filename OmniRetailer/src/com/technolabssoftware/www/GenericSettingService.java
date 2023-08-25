/**
 * GenericSettingService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface GenericSettingService extends java.rmi.Remote {
    public java.lang.String updateCustomerSettings(java.lang.String updateStr) throws java.rmi.RemoteException;
    public java.lang.String updatePrintSettings(java.lang.String updateSettings) throws java.rmi.RemoteException;
    public java.lang.String createPrintSettings(java.lang.String createSettings) throws java.rmi.RemoteException;
    public java.lang.String getMessageSettings(java.lang.String getMsgSettings) throws java.rmi.RemoteException;
    public java.lang.String createRegionalSettings(java.lang.String createRegional) throws java.rmi.RemoteException;
    public java.lang.String createIntegrationSettings(java.lang.String createIntegration) throws java.rmi.RemoteException;
    public java.lang.String updateSecuritySettings(java.lang.String updateSecurity) throws java.rmi.RemoteException;
    public java.lang.String updateRegionalSettings(java.lang.String createRegional) throws java.rmi.RemoteException;
    public java.lang.String getSecuritySettings(java.lang.String getSecurity) throws java.rmi.RemoteException;
    public java.lang.String createMailSettings(java.lang.String crate) throws java.rmi.RemoteException;
    public java.lang.String createSecuritySettings(java.lang.String createSecurity) throws java.rmi.RemoteException;
    public java.lang.String getPrintSettings(java.lang.String getSettings) throws java.rmi.RemoteException;
    public java.lang.String getCustomerSettings(java.lang.String getCustomer) throws java.rmi.RemoteException;
    public java.lang.String updateMailSettings(java.lang.String update) throws java.rmi.RemoteException;
    public java.lang.String updateIntegrationSettings(java.lang.String updateIntegration) throws java.rmi.RemoteException;
    public java.lang.String createCustomerSettings(java.lang.String createCustomer) throws java.rmi.RemoteException;
    public java.lang.String getMailSettings(java.lang.String getMails) throws java.rmi.RemoteException;
    public java.lang.String updateMessageSettings(java.lang.String update) throws java.rmi.RemoteException;
    public java.lang.String getRegionalSettings(java.lang.String getRegional) throws java.rmi.RemoteException;
    public java.lang.String getIntegrationSettings(java.lang.String getIntegration) throws java.rmi.RemoteException;
    public java.lang.String createMessageSettings(java.lang.String crate) throws java.rmi.RemoteException;
}
