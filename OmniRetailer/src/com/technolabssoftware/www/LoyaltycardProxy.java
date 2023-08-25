package com.technolabssoftware.www;

public class LoyaltycardProxy implements com.technolabssoftware.www.Loyaltycard {
  private String _endpoint = null;
  private com.technolabssoftware.www.Loyaltycard loyaltycard = null;
  
  public LoyaltycardProxy() {
    _initLoyaltycardProxy();
  }
  
  public LoyaltycardProxy(String endpoint) {
    _endpoint = endpoint;
    _initLoyaltycardProxy();
  }
  
  private void _initLoyaltycardProxy() {
    try {
      loyaltycard = (new com.technolabssoftware.www.LoyaltycardServiceLocator()).getLoyaltycardImplPort();
      if (loyaltycard != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)loyaltycard)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)loyaltycard)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (loyaltycard != null)
      ((javax.xml.rpc.Stub)loyaltycard)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Loyaltycard getLoyaltycard() {
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard;
  }
  
  public java.lang.String getloyaltyCardNumber(java.lang.String requestHeader) throws java.rmi.RemoteException{
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard.getloyaltyCardNumber(requestHeader);
  }
  
  public java.lang.String getLoyaltyCards(java.lang.String loyaltyCardDetails) throws java.rmi.RemoteException{
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard.getLoyaltyCards(loyaltyCardDetails);
  }
  
  public java.lang.String createLoyaltyCards(java.lang.String loyaltyCardDetails) throws java.rmi.RemoteException{
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard.createLoyaltyCards(loyaltyCardDetails);
  }
  
  public java.lang.String supplyLoyaltyCard(java.lang.String loyaltyCardDetails) throws java.rmi.RemoteException{
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard.supplyLoyaltyCard(loyaltyCardDetails);
  }
  
  public java.lang.String getloyaltyCardIds(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard.getloyaltyCardIds(searchCriteria);
  }
  
  public java.lang.String getissuedLoyaltycard(java.lang.String loyaltyCardNumber) throws java.rmi.RemoteException{
    if (loyaltycard == null)
      _initLoyaltycardProxy();
    return loyaltycard.getissuedLoyaltycard(loyaltyCardNumber);
  }
  
  
}