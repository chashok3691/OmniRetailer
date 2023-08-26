package com.technolabssoftware.www;

public class MemberServiceProxy implements com.technolabssoftware.www.MemberService {
  private String _endpoint = null;
  private com.technolabssoftware.www.MemberService memberService = null;
  
  public MemberServiceProxy() {
    _initMemberServiceProxy();
  }
  
  public MemberServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initMemberServiceProxy();
  }
  
  private void _initMemberServiceProxy() {
    try {
      memberService = (new com.technolabssoftware.www.MemberServicesLocator()).getMemberServiceImplPort();
      if (memberService != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)memberService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)memberService)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (memberService != null)
      ((javax.xml.rpc.Stub)memberService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.MemberService getMemberService() {
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService;
  }
  
  public java.lang.String getMembers(java.lang.String arg0) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.getMembers(arg0);
  }
  
  public java.lang.String authenticateUser(java.lang.String loginDetails) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.authenticateUser(loginDetails);
  }
  
  public java.lang.String generateOTP(java.lang.String userDetails) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.generateOTP(userDetails);
  }
  
  public java.lang.String createMember(java.lang.String memberDetails) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.createMember(memberDetails);
  }
  
  public java.lang.String getMemberDetails(java.lang.String arg0) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.getMemberDetails(arg0);
  }
  
  public java.lang.String userRegistration(java.lang.String userDetails) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.userRegistration(userDetails);
  }
  
  public java.lang.String updateMember(java.lang.String arg0) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.updateMember(arg0);
  }
  
  public java.lang.String changePassword(java.lang.String arg0) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.changePassword(arg0);
  }
  
  public java.lang.String validateOTP(java.lang.String otpDetails) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.validateOTP(otpDetails);
  }
  
  public java.lang.String resetPassword(java.lang.String passwordDetails) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.resetPassword(passwordDetails);
  }
  
  public java.lang.String deleteMember(java.lang.String arg0) throws java.rmi.RemoteException{
    if (memberService == null)
      _initMemberServiceProxy();
    return memberService.deleteMember(arg0);
  }
  
  
}