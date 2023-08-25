package com.technolabssoftware.www;

public class AssetMasterServiceProxy implements com.technolabssoftware.www.AssetMasterService_PortType {
  private String _endpoint = null;
  private com.technolabssoftware.www.AssetMasterService_PortType assetMasterService_PortType = null;
  
  public AssetMasterServiceProxy() {
    _initAssetMasterServiceProxy();
  }
  
  public AssetMasterServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initAssetMasterServiceProxy();
  }
  
  private void _initAssetMasterServiceProxy() {
    try {
      assetMasterService_PortType = (new com.technolabssoftware.www.AssetMasterService_ServiceLocator()).getAssetMasterServiceImplPort();
      if (assetMasterService_PortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)assetMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)assetMasterService_PortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (assetMasterService_PortType != null)
      ((javax.xml.rpc.Stub)assetMasterService_PortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.AssetMasterService_PortType getAssetMasterService_PortType() {
    if (assetMasterService_PortType == null)
      _initAssetMasterServiceProxy();
    return assetMasterService_PortType;
  }
  
  public java.lang.String createAsset(java.lang.String crate) throws java.rmi.RemoteException{
    if (assetMasterService_PortType == null)
      _initAssetMasterServiceProxy();
    return assetMasterService_PortType.createAsset(crate);
  }
  
  public java.lang.String deleteAsset(java.lang.String delete) throws java.rmi.RemoteException{
    if (assetMasterService_PortType == null)
      _initAssetMasterServiceProxy();
    return assetMasterService_PortType.deleteAsset(delete);
  }
  
  public java.lang.String getAssets(java.lang.String getAsset) throws java.rmi.RemoteException{
    if (assetMasterService_PortType == null)
      _initAssetMasterServiceProxy();
    return assetMasterService_PortType.getAssets(getAsset);
  }
  
  public java.lang.String updateAsset(java.lang.String update) throws java.rmi.RemoteException{
    if (assetMasterService_PortType == null)
      _initAssetMasterServiceProxy();
    return assetMasterService_PortType.updateAsset(update);
  }
  
  
}