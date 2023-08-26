package com.tlabs.posweb.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.LocalizedResourceHelper;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.AbstractView;

/**
 * 
 * @author Syam
 *
 */
public abstract class AbstractExcelView extends AbstractView  {

	/** The content type for an Excel response */	
	private static final String CONTENT_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";	
	
	/** The extension to look for existing templates */	
	private static final String EXTENSION = ".xlsx";	
	private String url;	
	
	/**	 * Default Constructor.	 * Sets the content type of the view to "application/vnd.ms-excel".	 */	
	public AbstractExcelView() {		
		setContentType(CONTENT_TYPE);	
	}
	
	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	protected boolean generatesDownloadContent() {
		return true;
	}

	/**
	 * Renders the Excel view, given the specified model.
	 */
	@Override
	protected final void renderMergedOutputModel(
			Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		Workbook workbook;
		ByteArrayOutputStream baos = createTemporaryOutputStream();
		
			workbook = new XSSFWorkbook();
			logger.debug("Created Excel Workbook from scratch");

		buildExcelDocument(model, workbook, request, response);

		workbook.write(baos);
		writeToResponse(response, baos);
	
	}
	
	protected Workbook getTemplateSource(String url, HttpServletRequest request) throws IOException {
		LocalizedResourceHelper helper = new LocalizedResourceHelper(getApplicationContext());
		Locale userLocale = RequestContextUtils.getLocale(request);
		Resource inputFile = helper.findLocalizedResource(url, EXTENSION, userLocale);

		if (logger.isDebugEnabled()) {
			logger.debug("Loading Excel workbook from " + inputFile);
		}
		return new XSSFWorkbook(inputFile.getInputStream());
	}
	
	protected abstract void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response);
	
	protected Cell getCell(Sheet sheet, int row, int col) {
		Row sheetRow = sheet.getRow(row);
		if (sheetRow == null) {
			sheetRow = sheet.createRow(row);
		}
		Cell cell = sheetRow.getCell(col);
		if (cell == null) {
			cell = sheetRow.createCell(col);
		}
		return cell;
	}
	protected void setText(Cell cell, String text) {
		cell.setCellType(Cell.CELL_TYPE_STRING);
		cell.setCellValue(text);
	}
}
