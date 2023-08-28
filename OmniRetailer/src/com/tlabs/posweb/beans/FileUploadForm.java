package com.tlabs.posweb.beans;
 
import org.springframework.web.multipart.MultipartFile;
 
/**
 * @author Mythri.S
 *
 */
public class FileUploadForm {
 
    private MultipartFile files0;
    private MultipartFile files1;
    private MultipartFile files2;
	public MultipartFile getFiles0() {
		return files0;
	}
	public void setFiles0(MultipartFile files0) {
		this.files0 = files0;
	}
	public MultipartFile getFiles1() {
		return files1;
	}
	public void setFiles1(MultipartFile files1) {
		this.files1 = files1;
	}
	public MultipartFile getFiles2() {
		return files2;
	}
	public void setFiles2(MultipartFile files2) {
		this.files2 = files2;
	}
     
    
    
    //Getter and setter methods
}