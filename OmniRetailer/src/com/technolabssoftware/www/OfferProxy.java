package com.technolabssoftware.www;

public class OfferProxy implements com.technolabssoftware.www.Offer {
  private String _endpoint = null;
  private com.technolabssoftware.www.Offer offer = null;
  
  public OfferProxy() {
    _initOfferProxy();
  }
  
  public OfferProxy(String endpoint) {
    _endpoint = endpoint;
    _initOfferProxy();
  }
  
  private void _initOfferProxy() {
    try {
      offer = (new com.technolabssoftware.www.OfferServiceLocator()).getOfferImplPort();
      if (offer != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)offer)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)offer)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (offer != null)
      ((javax.xml.rpc.Stub)offer)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.Offer getOffer() {
    if (offer == null)
      _initOfferProxy();
    return offer;
  }
  
  public java.lang.String searchOffers(java.lang.String searchCriteria) throws java.rmi.RemoteException{
    if (offer == null)
      _initOfferProxy();
    return offer.searchOffers(searchCriteria);
  }
  
  public java.lang.String updateOffer(java.lang.String offerDetails) throws java.rmi.RemoteException{
    if (offer == null)
      _initOfferProxy();
    return offer.updateOffer(offerDetails);
  }
  
  public java.lang.String deleteOffers(java.lang.String offerIDs) throws java.rmi.RemoteException{
    if (offer == null)
      _initOfferProxy();
    return offer.deleteOffers(offerIDs);
  }
  
  public java.lang.String getOffer(java.lang.String offerID) throws java.rmi.RemoteException{
    if (offer == null)
      _initOfferProxy();
    return offer.getOffer(offerID);
  }
  
  public java.lang.String createOffer(java.lang.String offerDetails) throws java.rmi.RemoteException{
    if (offer == null)
      _initOfferProxy();
    return offer.createOffer(offerDetails);
  }
  
  public java.lang.String addAttahmentInTemp(com.technolabssoftware.www.Attachment taskExecutionInput) throws java.rmi.RemoteException{
    if (offer == null)
      _initOfferProxy();
    return offer.addAttahmentInTemp(taskExecutionInput);
  }
  
  
}