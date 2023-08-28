package com.tlabs.posweb.util;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.tlabs.posweb.beans.ReportsView;

/**
 * 
 * @author Syam
 *
 */
public abstract class AbstractITextPdfView extends AbstractView {

	public AbstractITextPdfView() {
		setContentType("application/pdf");
	}

	@Override
	protected boolean generatesDownloadContent() {
		return true;
	}
		
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ReportsView view = (ReportsView) model.get("pdfList");
		
		// IE workaround: write into byte array first.
		ByteArrayOutputStream baos = createTemporaryOutputStream();
		Document document = null;
		// Apply preferences and build metadata.
		int size = view.getColumnNames().size();
		if(size <= 7) {
			document = newDocument();
		} else if (size > 7 && size < 16) {
			document = newA4LandscapeDocument();
		} else {
			document = newLegalLandscapeDocument();
		}
		
		PdfWriter writer = newWriter(document, baos);
		prepareWriter(model, writer, request);
		buildPdfMetadata(model, document, request);

		document.open();
		buildPdfDocument(model, document, writer, request, response);
		
		document.close();

		// Flush to HTTP response.
		writeToResponse(response, baos);
	}

	protected Document newDocument() {
		return new Document(PageSize.A4);
	}
	
	protected Document newA4LandscapeDocument() {
		return new Document(PageSize.A4.rotate());
	}
	
	protected Document newLegalLandscapeDocument() {
		return new Document(PageSize.LEGAL.rotate());
	}
	
	protected PdfWriter newWriter(Document document, OutputStream os) throws DocumentException {
		return PdfWriter.getInstance(document, os);
	}
	
	protected void prepareWriter(Map<String, Object> model, PdfWriter writer, HttpServletRequest request) throws DocumentException {
		writer.setViewerPreferences(getViewerPreferences());
	}
	
	protected int getViewerPreferences() {
		return PdfWriter.ALLOW_PRINTING | PdfWriter.PageLayoutSinglePage;
	}
	
	protected void buildPdfMetadata(Map<String, Object> model, Document document, HttpServletRequest request) {
	
	}
	
	protected abstract void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception;	
}