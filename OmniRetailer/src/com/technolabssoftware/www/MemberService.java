/**
 * MemberService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface MemberService extends java.rmi.Remote {
    public java.lang.String getMembers(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String authenticateUser(java.lang.String loginDetails) throws java.rmi.RemoteException;
    public java.lang.String generateOTP(java.lang.String userDetails) throws java.rmi.RemoteException;
    public java.lang.String createMember(java.lang.String memberDetails) throws java.rmi.RemoteException;
    public java.lang.String getMemberDetails(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String userRegistration(java.lang.String userDetails) throws java.rmi.RemoteException;
    public java.lang.String updateMember(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String changePassword(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String validateOTP(java.lang.String otpDetails) throws java.rmi.RemoteException;
    public java.lang.String resetPassword(java.lang.String passwordDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteMember(java.lang.String arg0) throws java.rmi.RemoteException;
}
