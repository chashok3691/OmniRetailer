/**
 * Counters.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Counters extends java.rmi.Remote {
    public java.lang.String deleteCounter(java.lang.String counterDetails) throws java.rmi.RemoteException;
    public java.lang.String createCounter(java.lang.String counterDetails) throws java.rmi.RemoteException;
    public java.lang.String getCounters(java.lang.String counterDetails) throws java.rmi.RemoteException;
    public java.lang.String updateCounter(java.lang.String counterDetails) throws java.rmi.RemoteException;
}
