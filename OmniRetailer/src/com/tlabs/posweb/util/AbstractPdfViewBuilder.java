/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 3-9-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.util;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * @author Sahitya
 * Verified By : 
 * 
 * This abstract class is used to do settings for pdf generation
 * Settings like preparing page size,enabled printing,enabled download
 */
public abstract class AbstractPdfViewBuilder extends AbstractView {

	/**
	 * Set PDF as content type for response
	 */
	public AbstractPdfViewBuilder(){
		setContentType("application/pdf");
	}
	
	@Override
	protected boolean generatesDownloadContent() {
		return true;
	}
	
	/**
	 * This method is in Spring Abstract View class,overriding here to make PDF generating process
	 */
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		// write into byte array first.
		ByteArrayOutputStream baos = createTemporaryOutputStream();

		// Apply preferences and build metadata.
		Document document = newDocument();
		
		PdfWriter writer = newWriter(document, baos);
		prepareWriter(model, writer, request);
		
		buildPdfMetadata(model, document, request);

		// Build PDF document.
		document.open();
		buildPdfDocument(model, document, writer, request, response);
		document.close();

		// Flush to HTTP response.
		writeToResponse(response, baos);
	}
	
	/**
	 * Creating a document with A4 page size
	 * @return Document
	 */
	protected Document newDocument() {
		return new Document(PageSize.A4);
	}
	
	/**
	 * This method is used to return pdf writer object containing document and output stream having byte array
	 * @param document
	 * @param os
	 * @return PDF Writer
	 * @throws DocumentException
	 */
	protected PdfWriter newWriter(Document document, OutputStream os) throws DocumentException {
		return PdfWriter.getInstance(document, os);
	}
	/**
	 * Preparing writer with viewing preferences
	 * 
	 */
	protected void prepareWriter(Map<String, Object> model, PdfWriter writer, HttpServletRequest request)
			throws DocumentException {

		writer.setViewerPreferences(getViewerPreferences());
	}
	
	/**
	 * This method returns viewing preferences allowing printing
	 * @return value
	 */
	protected int getViewerPreferences() {
		return PdfWriter.ALLOW_PRINTING | PdfWriter.PageLayoutSinglePage;
	}
	
	protected Document newA4LandscapeDocument() {
		return new Document(PageSize.A4.rotate());
	}
	
	protected Document newLegalLandscapeDocument() {
		return new Document(PageSize.LEGAL.rotate());
	}

	protected void buildPdfMetadata(Map<String, Object> model, Document document, HttpServletRequest request) {
	}
	
	public class pageEvents extends PdfPageEventHelper {
		private Phrase watermark = null;
		public pageEvents(String watermarkName){
			watermark = new Phrase(watermarkName, new Font(FontFamily.HELVETICA, 60, Font.NORMAL, BaseColor.LIGHT_GRAY));
		}
        
		/* public void onStartPage(PdfWriter writer,Document document) {
		    	Rectangle rect = writer.getBoxSize("art");
		        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER,pdfHeading,298, 421, 45);
		    }*/
		  
        @Override
        public void onEndPage(PdfWriter writer, Document document) {
            PdfContentByte canvas = writer.getDirectContentUnder();
            ColumnText.showTextAligned(canvas, Element.ALIGN_CENTER, watermark, 298, 421, 45);
        }
    }
	protected abstract void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception;	
}
