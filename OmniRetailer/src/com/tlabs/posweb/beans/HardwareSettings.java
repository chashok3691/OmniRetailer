package com.tlabs.posweb.beans;

import java.util.List;
import java.util.Map;

public class HardwareSettings {
	
	private String androidTAb;
	private String wAllet;
	private String weighingMAchine;
	private String iPad;
	private String barcodeSCanners;
	private String paymentPRovider;
	

	public Map<String, Object> getPosDevice() {
		return posDevice;
	}
	public void setPosDevice(Map<String, Object> posDevice) {
		this.posDevice = posDevice;
	}
	
	Map<String,Object> posDevice;

	
	private List<Map<String,Object>> Printers;
	private List<Map<String,Object>> barcodeScanners;
	private List<Map<String,Object>> weighingMachines;
	private String videoStreaming;
	private String FootFalls;
	private String WiFiCarts;
	private String RFIDTagging;
	private String barcode_Scanner_A;
	private String BarcodeLabelPrinter;
	private String SelfLabelling;
	private String paymentDevice;
	
	

	
	public String getPaymentDevice() {
		return paymentDevice;
	}
	public void setPaymentDevice(String paymentDevice) {
		this.paymentDevice = paymentDevice;
	}
	public String getVideoStreaming() {
		return videoStreaming;
	}
	public void setVideoStreaming(String videoStreaming) {
		this.videoStreaming = videoStreaming;
	}
	public String getFootFalls() {
		return FootFalls;
	}
	public void setFootFalls(String footFalls) {
		FootFalls = footFalls;
	}
	public String getWiFiCarts() {
		return WiFiCarts;
	}
	public void setWiFiCarts(String wiFiCarts) {
		WiFiCarts = wiFiCarts;
	}
	public String getRFIDTagging() {
		return RFIDTagging;
	}
	public void setRFIDTagging(String rFIDTagging) {
		RFIDTagging = rFIDTagging;
	}
	public String getBarcode_Scanner_A() {
		return barcode_Scanner_A;
	}
	public void setBarcode_Scanner_A(String barcode_Scanner_A) {
		this.barcode_Scanner_A = barcode_Scanner_A;
	}
	public String getBarcodeLabelPrinter() {
		return BarcodeLabelPrinter;
	}
	public void setBarcodeLabelPrinter(String barcodeLabelPrinter) {
		BarcodeLabelPrinter = barcodeLabelPrinter;
	}
	public String getSelfLabelling() {
		return SelfLabelling;
	}
	public void setSelfLabelling(String selfLabelling) {
		SelfLabelling = selfLabelling;
	}
	public List<Map<String, Object>> getPrinters() {
		return Printers;
	}
	public void setPrinters(List<Map<String, Object>> printers) {
		Printers = printers;
	}
	public List<Map<String, Object>> getBarcodeScanners() {
		return barcodeScanners;
	}
	public void setBarcodeScanners(List<Map<String, Object>> barcodeScanners) {
		this.barcodeScanners = barcodeScanners;
	}
	public List<Map<String, Object>> getWeighingMachines() {
		return weighingMachines;
	}
	public void setWeighingMachines(List<Map<String, Object>> weighingMachines) {
		this.weighingMachines = weighingMachines;
	}
	
	
	public String getAndroidTAb() {
		return androidTAb;
	}
	public void setAndroidTAb(String androidTAb) {
		this.androidTAb = androidTAb;
	}
	public String getwAllet() {
		return wAllet;
	}
	public void setwAllet(String wAllet) {
		this.wAllet = wAllet;
	}
	public String getWeighingMAchine() {
		return weighingMAchine;
	}
	public void setWeighingMAchine(String weighingMAchine) {
		this.weighingMAchine = weighingMAchine;
	}
	public String getiPad() {
		return iPad;
	}
	public void setiPad(String iPad) {
		this.iPad = iPad;
	}
	public String getBarcodeSCanners() {
		return barcodeSCanners;
	}
	public void setBarcodeSCanners(String barcodeSCanners) {
		this.barcodeSCanners = barcodeSCanners;
	}
	public String getPaymentPRovider() {
		return paymentPRovider;
	}
	public void setPaymentPRovider(String paymentPRovider) {
		this.paymentPRovider = paymentPRovider;
	}
	
	
	
	
}
