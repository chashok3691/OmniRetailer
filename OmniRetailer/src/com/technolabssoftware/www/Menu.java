/**
 * Menu.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.technolabssoftware.www;

public interface Menu extends java.rmi.Remote {
    public java.lang.String updateMenuItems(java.lang.String menuItemsDetails) throws java.rmi.RemoteException;
    public java.lang.String createMenu(java.lang.String menuDetails) throws java.rmi.RemoteException;
    public java.lang.String updateMenu(java.lang.String menuDetails) throws java.rmi.RemoteException;
    public java.lang.String addItemToMenu(java.lang.String menuDetails) throws java.rmi.RemoteException;
    public java.lang.String getitems(java.lang.String itemDetails) throws java.rmi.RemoteException;
    public java.lang.String deletemenu(java.lang.String menuName) throws java.rmi.RemoteException;
    public java.lang.String getCategoryDetails(java.lang.String categoryDetails) throws java.rmi.RemoteException;
    public java.lang.String getMenuDetails(java.lang.String menuDetails) throws java.rmi.RemoteException;
}
