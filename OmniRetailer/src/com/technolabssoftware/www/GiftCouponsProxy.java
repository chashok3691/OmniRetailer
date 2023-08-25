package com.technolabssoftware.www;

public class GiftCouponsProxy implements com.technolabssoftware.www.GiftCoupons {
  private String _endpoint = null;
  private com.technolabssoftware.www.GiftCoupons giftCoupons = null;
  
  public GiftCouponsProxy() {
    _initGiftCouponsProxy();
  }
  
  public GiftCouponsProxy(String endpoint) {
    _endpoint = endpoint;
    _initGiftCouponsProxy();
  }
  
  private void _initGiftCouponsProxy() {
    try {
      giftCoupons = (new com.technolabssoftware.www.GiftCouponServicesLocator()).getGiftCouponsImplPort();
      if (giftCoupons != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)giftCoupons)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)giftCoupons)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (giftCoupons != null)
      ((javax.xml.rpc.Stub)giftCoupons)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.GiftCoupons getGiftCoupons() {
    if (giftCoupons == null)
      _initGiftCouponsProxy();
    return giftCoupons;
  }
  
  public java.lang.String getGiftCouponsMaster(java.lang.String giftCouponDetails) throws java.rmi.RemoteException{
    if (giftCoupons == null)
      _initGiftCouponsProxy();
    return giftCoupons.getGiftCouponsMaster(giftCouponDetails);
  }
  
  public java.lang.String getGiftCoupons(java.lang.String getGiftCouponsRequest) throws java.rmi.RemoteException{
    if (giftCoupons == null)
      _initGiftCouponsProxy();
    return giftCoupons.getGiftCoupons(getGiftCouponsRequest);
  }
  
  public java.lang.String getCouponDetails(java.lang.String couponDetails) throws java.rmi.RemoteException{
    if (giftCoupons == null)
      _initGiftCouponsProxy();
    return giftCoupons.getCouponDetails(couponDetails);
  }
  
  public java.lang.String createGiftCoupons(java.lang.String giftCouponDetails) throws java.rmi.RemoteException{
    if (giftCoupons == null)
      _initGiftCouponsProxy();
    return giftCoupons.createGiftCoupons(giftCouponDetails);
  }
  
  
}