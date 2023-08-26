package com.tlabs.posweb.beans;

public class PrintFormat {
	
	private String fontName;
	private String fontSize;
	private String fontColor;
	private String bold;
	private String italic;
	private String underline;
	private String maxWidth;
	private String textAlign;
	private String keyName;
	private String content;
	private String isBarcode;
	private String isImage;
	
	

	public PrintFormat(String fontName, String fontSize, String fontColor, String bold, String italic,
			String underline, String maxWidth, String textAlign, String keyName, String isBarcode, String isImage) {
		super();
		this.fontName = fontName;
		this.fontSize = fontSize;
		this.fontColor = fontColor;
		this.bold = bold;
		this.italic = italic;
		this.underline = underline;
		this.maxWidth = maxWidth;
		this.textAlign = textAlign;
		this.keyName = keyName;
		this.isBarcode = isBarcode;
		this.isImage = isImage;
	}
	
	
	
	public String getIsBarcode() {
		return isBarcode;
	}

	public void setIsBarcode(String isBarcode) {
		this.isBarcode = isBarcode;
	}

	public String getIsImage() {
		return isImage;
	}

	public void setIsImage(String isImage) {
		this.isImage = isImage;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getKeyName() {
		return keyName;
	}
	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}
	public String getTextAlign() {
		return textAlign;
	}
	public void setTextAlign(String textAlign) {
		this.textAlign = textAlign;
	}
	public String getFontName() {
		return fontName;
	}
	public void setFontName(String fontName) {
		this.fontName = fontName;
	}
	public String getFontSize() {
		return fontSize;
	}
	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}
	public String getFontColor() {
		return fontColor;
	}
	public void setFontColor(String fontColor) {
		this.fontColor = fontColor;
	}
	public String getBold() {
		return bold;
	}
	public void setBold(String bold) {
		this.bold = bold;
	}
	public String getItalic() {
		return italic;
	}
	public void setItalic(String italic) {
		this.italic = italic;
	}
	public String getUnderline() {
		return underline;
	}
	public void setUnderline(String underline) {
		this.underline = underline;
	}
	public String getMaxWidth() {
		return maxWidth;
	}
	public void setMaxWidth(String maxWidth) {
		this.maxWidth = maxWidth;
	}
}
