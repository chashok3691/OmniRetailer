package com.technolabssoftware.www;

public class GiftVouchersProxy implements com.technolabssoftware.www.GiftVouchers {
  private String _endpoint = null;
  private com.technolabssoftware.www.GiftVouchers giftVouchers = null;
  
  public GiftVouchersProxy() {
    _initGiftVouchersProxy();
  }
  
  public GiftVouchersProxy(String endpoint) {
    _endpoint = endpoint;
    _initGiftVouchersProxy();
  }
  
  private void _initGiftVouchersProxy() {
    try {
      giftVouchers = (new com.technolabssoftware.www.GiftVoucherServicesLocator()).getGiftVouchersImplPort();
      if (giftVouchers != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)giftVouchers)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)giftVouchers)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (giftVouchers != null)
      ((javax.xml.rpc.Stub)giftVouchers)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.GiftVouchers getGiftVouchers() {
    if (giftVouchers == null)
      _initGiftVouchersProxy();
    return giftVouchers;
  }
  
  public java.lang.String createGiftVouchers(java.lang.String giftVoucherDetails) throws java.rmi.RemoteException{
    if (giftVouchers == null)
      _initGiftVouchersProxy();
    return giftVouchers.createGiftVouchers(giftVoucherDetails);
  }
  
  public java.lang.String issueVoucherToCustomer(java.lang.String createIssueDetails) throws java.rmi.RemoteException{
    if (giftVouchers == null)
      _initGiftVouchersProxy();
    return giftVouchers.issueVoucherToCustomer(createIssueDetails);
  }
  
  public java.lang.String getGiftVouchers(java.lang.String giftVoucherDetails) throws java.rmi.RemoteException{
    if (giftVouchers == null)
      _initGiftVouchersProxy();
    return giftVouchers.getGiftVouchers(giftVoucherDetails);
  }
  
  public java.lang.String getAvailableVouchers(java.lang.String getVoucherDetails) throws java.rmi.RemoteException{
    if (giftVouchers == null)
      _initGiftVouchersProxy();
    return giftVouchers.getAvailableVouchers(getVoucherDetails);
  }
  
  public java.lang.String getGiftVoucherDetails(java.lang.String giftVoucherDetails) throws java.rmi.RemoteException{
    if (giftVouchers == null)
      _initGiftVouchersProxy();
    return giftVouchers.getGiftVoucherDetails(giftVoucherDetails);
  }
  
  
}