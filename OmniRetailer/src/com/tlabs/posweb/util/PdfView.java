package com.tlabs.posweb.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.tlabs.posweb.beans.ReportsView;

/**
 * 
 * @author Syam
 *
 */
public class PdfView extends AbstractITextPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// get data model which is passed by the Spring container
		ReportsView view = (ReportsView) model.get("pdfList");
		Font font1 = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
		Font font2 = new Font(Font.FontFamily.HELVETICA, 8, Font.ITALIC);

		Paragraph header = new Paragraph(view.getReportHeading(), font1);
		header.setAlignment(Element.ALIGN_CENTER);
		doc.add(header);
		
		Paragraph heading = new Paragraph(view.getReportHeading1(), font2);
		heading.setAlignment(Element.ALIGN_CENTER);
		doc.add(heading);
		
		PdfPTable table = new PdfPTable(view.getColumnNames().size());
		table.setWidthPercentage(100.0f);
		table.setSpacingBefore(10);
		
		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		cell.setPadding(5);
		
		// write table header 
		for(String columnName : view.getColumnNames()) {
			cell.setPhrase(new Phrase(columnName, font));
			table.addCell(cell);
		}
		
		// write table row data
		int count = 1;
		for(List<String> rowList : view.getResultList()) {
			PdfPCell columnCell = new PdfPCell();
			columnCell.setPadding(5);
			for(String columnValue : rowList) {
				columnCell.setPhrase(new Phrase(columnValue));
				/*if(count % 2 == 0) {
					columnCell.setBackgroundColor(BaseColor.GRAY);
				}*/ 
				columnCell.setVerticalAlignment(Element.ALIGN_CENTER);
				table.addCell(columnCell);
			}
			count++;
		}
		doc.add(table);
	}
}