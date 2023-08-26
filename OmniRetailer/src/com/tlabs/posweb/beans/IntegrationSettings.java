package com.tlabs.posweb.beans;

import java.util.List;
//import java.util.Map;


/*import com.tlabs.posweb.services.HardwareSettings;*/

public class IntegrationSettings {

	
	private String printer;
	private String cashDrawers;
	private String paymentProvider;
	private String wallet;
	private String weighingMachine;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;

	


	private HardwareSettings hardwareSettings;
	private SoftwareSettings softwareSettings;
	private IntegrationSettings integrationSettings;
	private String barcode_Scanner_A;
	private String barcodeLabelPrinter;
	private String selfLabelling;
	private String wiFiCarts;
	

	private String rfidTagging;
	private String footFalls;
	private String videoStreaming;
	private List<String> androidTab;
	private List<String> ipad;
	private List<String> windows;
	private List<String> ios;
	private List<String> PrinterType;
	private List<String> BarcodeType;
	private List<String> WeighingType;

	private String authorization;
	private String authorizationType;
	private String username;
	private String password;
	private String contentType;

	private String manufacturer;
	private String type;
	private String id;

	private String url;
	private List<IntegrationSettings> printerSettings;
	private List<IntegrationSettings> barcodeSettings;
	private List<IntegrationSettings> weighingMachineSettings;

	
	private String accessKey;
	

	//Added by Surya.k
	private IntegrationSettings placesApiAccess;
	private IntegrationSettings assetApiAccess;
	private IntegrationSettings fireBaseSettings;
	
	private String serviceAreaRequired;
	private String b2cRequired;
	private String paymentDevice;
	private String authenticationKey;
	
	private String emailId;
	private String message;
	
	private String portNO;
	private String protocol;
	
	private String server;
	private String userID;
	private String userPassword;
	private String encryptionKey;
	
	
	

	
	
	
	
	public String getEncryptionKey() {
		return encryptionKey;
	}



	public void setEncryptionKey(String encryptionKey) {
		this.encryptionKey = encryptionKey;
	}



	public String getServer() {
		return server;
	}



	public void setServer(String server) {
		this.server = server;
	}



	public String getUserID() {
		return userID;
	}



	public void setUserID(String userID) {
		this.userID = userID;
	}



	public String getUserPassword() {
		return userPassword;
	}



	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}



	public String getPortNO() {
		return portNO;
	}



	public void setPortNO(String portNO) {
		this.portNO = portNO;
	}



	public String getProtocol() {
		return protocol;
	}



	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}



	public String getEmailId() {
		return emailId;
	}



	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public IntegrationSettings getFireBaseSettings() {
		return fireBaseSettings;
	}



	public void setFireBaseSettings(IntegrationSettings fireBaseSettings) {
		this.fireBaseSettings = fireBaseSettings;
	}



	public String getAuthenticationKey() {
		return authenticationKey;
	}



	public void setAuthenticationKey(String authenticationKey) {
		this.authenticationKey = authenticationKey;
	}



	public String getPaymentDevice() {
		return paymentDevice;
	}



	public void setPaymentDevice(String paymentDevice) {
		this.paymentDevice = paymentDevice;
	}



	public String getB2cRequired() {
		return b2cRequired;
	}



	public void setB2cRequired(String b2cRequired) {
		this.b2cRequired = b2cRequired;
	}



	public String getServiceAreaRequired() {
		return serviceAreaRequired;
	}



	public void setServiceAreaRequired(String serviceAreaRequired) {
		this.serviceAreaRequired = serviceAreaRequired;
	}



	public IntegrationSettings getPlacesApiAccess() {
		return placesApiAccess;
	}



	public void setPlacesApiAccess(IntegrationSettings placesApiAccess) {
		this.placesApiAccess = placesApiAccess;
	}



	public IntegrationSettings getAssetApiAccess() {
		return assetApiAccess;
	}



	public void setAssetApiAccess(IntegrationSettings assetApiAccess) {
		this.assetApiAccess = assetApiAccess;
	}



	public String getAccessKey() {
		return accessKey;
	}



	public void setAccessKey(String accessKey) {
		this.accessKey = accessKey;
	}



	private IntegrationSettings integrationSettingsObj;

	public String getPrinter() {
		return printer;
	}



	public void setPrinter(String printer) {
		this.printer = printer;
	}



	public String getCashDrawers() {
		return cashDrawers;
	}



	public void setCashDrawers(String cashDrawers) {
		this.cashDrawers = cashDrawers;
	}



	public String getPaymentProvider() {
		return paymentProvider;
	}



	public void setPaymentProvider(String paymentProvider) {
		this.paymentProvider = paymentProvider;
	}



	public String getWallet() {
		return wallet;
	}



	public void setWallet(String wallet) {
		this.wallet = wallet;
	}



	public String getWeighingMachine() {
		return weighingMachine;
	}



	public void setWeighingMachine(String weighingMachine) {
		this.weighingMachine = weighingMachine;
	}



	public RequestHeader getRequestHeader() {
		return requestHeader;
	}



	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}



	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}



	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}



	public HardwareSettings getHardwareSettings() {
		return hardwareSettings;
	}



	public void setHardwareSettings(HardwareSettings hardwareSettings) {
		this.hardwareSettings = hardwareSettings;
	}



	public SoftwareSettings getSoftwareSettings() {
		return softwareSettings;
	}



	public void setSoftwareSettings(SoftwareSettings softwareSettings) {
		this.softwareSettings = softwareSettings;
	}



	public IntegrationSettings getIntegrationSettings() {
		return integrationSettings;
	}



	public void setIntegrationSettings(IntegrationSettings integrationSettings) {
		this.integrationSettings = integrationSettings;
	}



	public String getBarcode_Scanner_A() {
		return barcode_Scanner_A;
	}



	public void setBarcode_Scanner_A(String barcode_Scanner_A) {
		this.barcode_Scanner_A = barcode_Scanner_A;
	}



	public String getBarcodeLabelPrinter() {
		return barcodeLabelPrinter;
	}



	public void setBarcodeLabelPrinter(String barcodeLabelPrinter) {
		this.barcodeLabelPrinter = barcodeLabelPrinter;
	}



	public String getSelfLabelling() {
		return selfLabelling;
	}



	public void setSelfLabelling(String selfLabelling) {
		this.selfLabelling = selfLabelling;
	}



	public String getWiFiCarts() {
		return wiFiCarts;
	}



	public void setWiFiCarts(String wiFiCarts) {
		this.wiFiCarts = wiFiCarts;
	}



	public String getRfidTagging() {
		return rfidTagging;
	}



	public void setRfidTagging(String rfidTagging) {
		this.rfidTagging = rfidTagging;
	}



	public String getFootFalls() {
		return footFalls;
	}



	public void setFootFalls(String footFalls) {
		this.footFalls = footFalls;
	}



	public String getVideoStreaming() {
		return videoStreaming;
	}



	public void setVideoStreaming(String videoStreaming) {
		this.videoStreaming = videoStreaming;
	}



	public List<String> getAndroidTab() {
		return androidTab;
	}



	public void setAndroidTab(List<String> androidTab) {
		this.androidTab = androidTab;
	}



	public List<String> getIpad() {
		return ipad;
	}



	public void setIpad(List<String> ipad) {
		this.ipad = ipad;
	}



	public List<String> getWindows() {
		return windows;
	}



	public void setWindows(List<String> windows) {
		this.windows = windows;
	}



	public List<String> getIos() {
		return ios;
	}



	public void setIos(List<String> ios) {
		this.ios = ios;
	}



	public List<String> getPrinterType() {
		return PrinterType;
	}



	public void setPrinterType(List<String> printerType) {
		PrinterType = printerType;
	}



	public List<String> getBarcodeType() {
		return BarcodeType;
	}



	public void setBarcodeType(List<String> barcodeType) {
		BarcodeType = barcodeType;
	}



	public List<String> getWeighingType() {
		return WeighingType;
	}



	public void setWeighingType(List<String> weighingType) {
		WeighingType = weighingType;
	}



	public String getAuthorization() {
		return authorization;
	}



	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}



	public String getAuthorizationType() {
		return authorizationType;
	}



	public void setAuthorizationType(String authorizationType) {
		this.authorizationType = authorizationType;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getContentType() {
		return contentType;
	}



	public void setContentType(String contentType) {
		this.contentType = contentType;
	}



	public String getManufacturer() {
		return manufacturer;
	}



	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public List<IntegrationSettings> getPrinterSettings() {
		return printerSettings;
	}



	public void setPrinterSettings(List<IntegrationSettings> printerSettings) {
		this.printerSettings = printerSettings;
	}



	public List<IntegrationSettings> getBarcodeSettings() {
		return barcodeSettings;
	}



	public void setBarcodeSettings(List<IntegrationSettings> barcodeSettings) {
		this.barcodeSettings = barcodeSettings;
	}



	public List<IntegrationSettings> getWeighingMachineSettings() {
		return weighingMachineSettings;
	}



	public void setWeighingMachineSettings(List<IntegrationSettings> weighingMachineSettings) {
		this.weighingMachineSettings = weighingMachineSettings;
	}



	public IntegrationSettings getIntegrationSettingsObj() {
		return integrationSettingsObj;
	}



	public void setIntegrationSettingsObj(IntegrationSettings integrationSettingsObj) {
		this.integrationSettingsObj = integrationSettingsObj;
	}



}
