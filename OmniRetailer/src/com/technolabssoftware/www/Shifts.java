/**
 * Shifts.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Shifts extends java.rmi.Remote {
    public java.lang.String getShifts(java.lang.String shiftDetails) throws java.rmi.RemoteException;
    public java.lang.String updateShift(java.lang.String shiftDetails) throws java.rmi.RemoteException;
    public java.lang.String deleteShift(java.lang.String shiftDetails) throws java.rmi.RemoteException;
    public java.lang.String createShift(java.lang.String shiftDetails) throws java.rmi.RemoteException;
    public java.lang.String getShiftDetails(java.lang.String shiftDetails) throws java.rmi.RemoteException;
}
