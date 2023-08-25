package com.technolabssoftware.www;

public class ExportImportsProxy implements com.technolabssoftware.www.ExportImports {
  private String _endpoint = null;
  private com.technolabssoftware.www.ExportImports exportImports = null;
  
  public ExportImportsProxy() {
    _initExportImportsProxy();
  }
  
  public ExportImportsProxy(String endpoint) {
    _endpoint = endpoint;
    _initExportImportsProxy();
  }
  
  private void _initExportImportsProxy() {
    try {
      exportImports = (new com.technolabssoftware.www.ExportImportsServiceLocator()).getExportImportsImplPort();
      if (exportImports != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)exportImports)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)exportImports)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (exportImports != null)
      ((javax.xml.rpc.Stub)exportImports)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.technolabssoftware.www.ExportImports getExportImports() {
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports;
  }
  
  public java.lang.String uploadWarehouseSkuMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadWarehouseSkuMaster(header, file);
  }
  
  public java.lang.String uploadSkuEansUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadSkuEansUsingJDA(header, file);
  }
  
  public java.lang.String exportBills(java.lang.String fromDate) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportBills(fromDate);
  }
  
  public java.lang.String exportStockReturns(java.lang.String request) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportStockReturns(request);
  }
  
  public java.lang.String importGroupMasterData(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.importGroupMasterData(header, file);
  }
  
  public java.lang.String uploadSkuPriceUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadSkuPriceUsingJDA(header, file);
  }
  
  public java.lang.String importStockReciept(java.lang.String request, java.lang.String file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.importStockReciept(request, file);
  }
  
  public java.lang.String uploadSupplierMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadSupplierMaster(header, file);
  }
  
  public java.lang.String uploadSkuMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadSkuMaster(header, file);
  }
  
  public java.lang.String exportStockIssues(java.lang.String request) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportStockIssues(request);
  }
  
  public java.lang.String exportStockReceipts(java.lang.String request) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportStockReceipts(request);
  }
  
  public java.lang.String uploadProductMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadProductMaster(header, file);
  }
  
  public java.lang.String uploadDepartmentsUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadDepartmentsUsingJDA(header, file);
  }
  
  public java.lang.String uploadSkuMasterUsingJDA(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadSkuMasterUsingJDA(header, file);
  }
  
  public java.lang.String exportSkuMasterData(java.lang.String request) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportSkuMasterData(request);
  }
  
  public java.lang.String exportStockRequests(java.lang.String request) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportStockRequests(request);
  }
  
  public java.lang.String importEmployeeMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.importEmployeeMaster(header, file);
  }
  
  public java.lang.String exportBillings(java.lang.String request) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.exportBillings(request);
  }
  
  public java.lang.String uploadStockReceipt(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadStockReceipt(header, file);
  }
  
  public java.lang.String importTemporaryGroup(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.importTemporaryGroup(header, file);
  }
  
  public java.lang.String uploadSkuPriceInfo(java.lang.String skuPrices, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.uploadSkuPriceInfo(skuPrices, file);
  }
  
  public java.lang.String importBrandMaster(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.importBrandMaster(header, file);
  }

public java.lang.String uploadSupplierSkus(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
	    if (exportImports == null)
	      _initExportImportsProxy();
	    return exportImports.uploadSupplierSkus(header, file);
	  }
public java.lang.String getExcelHeaderPositions(java.lang.String header, com.technolabssoftware.www.FileUploader file) throws java.rmi.RemoteException{
    if (exportImports == null)
      _initExportImportsProxy();
    return exportImports.getExcelHeaderPositions(header, file);
  }



  
}