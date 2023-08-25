/**
 * ZoneMasterService_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface ZoneMasterService_PortType extends java.rmi.Remote {
    public java.lang.String deleteZone(java.lang.String delteZoneDetails) throws java.rmi.RemoteException;
    public java.lang.String getZones(java.lang.String zoneID) throws java.rmi.RemoteException;
    public java.lang.String updateZone(java.lang.String updateZoneDetails) throws java.rmi.RemoteException;
    public java.lang.String createZone(java.lang.String zoneDetails) throws java.rmi.RemoteException;
}
