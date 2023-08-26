package com.technolabssoftware.www;

public class MenuProxy implements com.technolabssoftware.www.Menu {
  private String _endpoint = null;
  private com.technolabssoftware.www.Menu menu = null;
  
  public MenuProxy() {
    _initMenuProxy();
  }
  
  public MenuProxy(String endpoint) {
    _endpoint = endpoint;
    _initMenuProxy();
  }
  
  private void _initMenuProxy() {
    try {
      menu = (new com.technolabssoftware.www.MenuServiceLocator()).getMenuImplPort();
      if (menu != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)menu)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)menu)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (menu != null)
      ((javax.xml.rpc.Stub)menu)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Menu getMenu() {
    if (menu == null)
      _initMenuProxy();
    return menu;
  }
  
  public java.lang.String updateMenuItems(java.lang.String menuItemsDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.updateMenuItems(menuItemsDetails);
  }
  
  public java.lang.String createMenu(java.lang.String menuDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.createMenu(menuDetails);
  }
  
  public java.lang.String updateMenu(java.lang.String menuDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.updateMenu(menuDetails);
  }
  
  public java.lang.String addItemToMenu(java.lang.String menuDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.addItemToMenu(menuDetails);
  }
  
  public java.lang.String getitems(java.lang.String itemDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.getitems(itemDetails);
  }
  
  public java.lang.String deletemenu(java.lang.String menuName) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.deletemenu(menuName);
  }
  
  public java.lang.String getCategoryDetails(java.lang.String categoryDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.getCategoryDetails(categoryDetails);
  }
  
  public java.lang.String getMenuDetails(java.lang.String menuDetails) throws java.rmi.RemoteException{
    if (menu == null)
      _initMenuProxy();
    return menu.getMenuDetails(menuDetails);
  }
  
  
}