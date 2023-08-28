package com.tlabs.posweb.util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
//import com.itextpdf.text.pdf.codec.Base64;
import com.itextpdf.text.pdf.draw.LineSeparator;
//import com.tlabs.posweb.beans.Billing;
//import com.tlabs.posweb.beans.PurchaseOrderBean;
import com.tlabs.posweb.beans.ReportsView;
//import com.tlabs.posweb.beans.WHPurchaseOrderItems;
//import com.tlabs.posweb.util.AbstractPdfViewBuilder.pageEvents;

public class BillingPdfGeneration extends AbstractPdfViewBuilder {

	 
	 
	@Override
	protected void buildPdfDocument(Map<String, Object> model,Document document, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Rectangle rect = new Rectangle(30, 30, 550, 800);
	    writer.setBoxSize("art", rect);
		HeaderFooterPageEvent events = new HeaderFooterPageEvent();
		writer.setPageEvent(events);
		ReportsView view = (ReportsView) model.get("reportsView");
		Font font1 = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
		Font font2 = new Font(Font.FontFamily.HELVETICA, 12);
		Font font3 = new Font(Font.FontFamily.HELVETICA, 10);
		
		PdfPTable headingTable = new PdfPTable(2);
		headingTable.setWidthPercentage(100);
		headingTable.setWidths(new int[]{4,1});
		headingTable.addCell(createNormalTextCell(view.getReportHeading(), font1,Element.ALIGN_TOP));
		headingTable.addCell(createNormalTextCell(view.getDateStr(), font2,Element.ALIGN_TOP));
		document.add(headingTable);
		
		Paragraph heading = new Paragraph(view.getReportHeading1(), font2);
		heading.setAlignment(Element.ALIGN_LEFT);
		document.add(heading);
		
		Paragraph heading1 = new Paragraph(view.getReportHeading2(), font3);
		heading1.setAlignment(Element.ALIGN_LEFT);
		document.add(heading1);
		
		PdfPTable billInfo = new PdfPTable(3);
		billInfo.setWidthPercentage(100);
		billInfo.setWidths(new int[]{5,1,2});
		for(int i = 0; i < 2; i++){
			billInfo.addCell(createNormalTextCell("", font3, Element.ALIGN_RIGHT));
			billInfo.addCell(createNormalTextCell(view.getKeys().get(i), font3, Element.ALIGN_LEFT));
			billInfo.addCell(createNormalTextCell(view.getValues().get(i), font3, Element.ALIGN_LEFT));
		}
		document.add(billInfo);
		
		document.add(new Paragraph("\n"));
		LineSeparator line = new LineSeparator(1, 100, new BaseColor(226, 226,226), Element.ALIGN_CENTER, 0);
		document.add(line);
		document.add(new Paragraph("\n"));
		PdfPTable table = new PdfPTable(view.getColumnNames().size());
		table.setWidthPercentage(100.0f);
		table.setSpacingBefore(10);
		table.setWidths(new int[]{50,200,50,50,85,100});
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
//		int count = 1;
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
//			count++;
		}
		document.add(table);
		
		PdfPTable summaryInfo = new PdfPTable(4);
		summaryInfo.setWidthPercentage(100);
		summaryInfo.setWidths(new int[]{5,2,1,1});
		for(int i = 2; i < view.getKeys().size(); i++){
			summaryInfo.addCell(createNormalTextCell("", font3, Element.ALIGN_RIGHT));
			summaryInfo.addCell(createNormalTextCell(view.getKeys().get(i), font3, Element.ALIGN_LEFT));
			summaryInfo.addCell(createNormalTextCell(":", font3, Element.ALIGN_RIGHT));
			summaryInfo.addCell(createNormalTextCell(view.getValues().get(i), font3, Element.ALIGN_LEFT));
		}
		document.add(new Paragraph("\n"));
		document.add(new Paragraph("\n"));
		document.add(summaryInfo);
		
		
		/*Paragraph footer = new Paragraph(view.getFooterStr());
		footer.setAlignment(Element.ALIGN_BOTTOM);
		document.add(footer);*/
		
		 /*Billing purchaseOrderBeanObj = (Billing) model.get("billingBean");
		 writer.setPageEvent(new pageEvents("Dhanvitha Enterprises"));//watermark
		// writer.setEncryption("TechnoLabs".getBytes(),"TechnoLabs".getBytes(), PdfWriter.ALLOW_PRINTING,PdfWriter.ENCRYPTION_AES_128);//encryption
//		  Image img = Image.getInstance(Base64.decode(purchaseOrderBeanObj.getWhPurchaseOrder().getLogo()));
		 
		  PdfPTable headingTable = new PdfPTable(3);
		  headingTable.setWidthPercentage(100);
		  headingTable.setWidths(new int[]{1,2,1});
		  headingTable.addCell(createImageCell(img));
		  headingTable.addCell(createTextCell(purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_doorNo()+"\n"+purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_street()+"\n"+
		                      purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_location()+"\n"+purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_city()));
		  headingTable.addCell(createTextCell(purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_doorNo()+"\n"+purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_street()+"\n"+
                  purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_location()+"\n"+purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_address_city()));
		  document.add(headingTable);
		  document.add(new Paragraph("\n"));
		  LineSeparator line = new LineSeparator(1, 100, new BaseColor(226, 226,226), Element.ALIGN_CENTER, 0);
		  document.add(line);
		  document.add(new Paragraph(""));
		  document.add(new Phrase("To",new Font(FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(193,88,59))));
		  document.add(new Paragraph(""));
		  document.add(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getSupplier_contact_name(),new Font(FontFamily.HELVETICA, 13, Font.NORMAL, new BaseColor(136,136,136))));
		  document.add(new Paragraph(""));
		  document.add(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getSupplier_name(),new Font(FontFamily.HELVETICA, 13, Font.NORMAL, new BaseColor(136,136,136))));
		    
		  
		  PdfPTable dateInfoTable = new PdfPTable(4);
		  dateInfoTable.setWidthPercentage(100);
		  dateInfoTable.setWidths(new float[] {18f, 13f, 20f, 30f});
		  
		  
		  PdfPCell dateCell = new PdfPCell();
		  dateCell.setBackgroundColor(new BaseColor(222,222,222));
		  dateCell.setPadding(5);
		  dateCell.setNoWrap(false);
		  dateCell.setPhrase(new Phrase("Date",new Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0,0,0))));
		  dateInfoTable.addCell(dateCell);
		  
		  PdfPCell dateValueCell = new PdfPCell();
		  dateValueCell.setBackgroundColor(new BaseColor(255,255,255));
		  dateValueCell.setPadding(5);
		  dateValueCell.setNoWrap(false);
		  dateValueCell.setPhrase(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getOrder_date(),new Font(FontFamily.HELVETICA, 12, Font.NORMAL, new BaseColor(0,0,0))));
		  dateInfoTable.addCell(dateValueCell);
		  
		  PdfPCell paymentTermsCell = new PdfPCell();
		  paymentTermsCell.setBackgroundColor(new BaseColor(222,222,222));
		  paymentTermsCell.setPadding(5);
		  paymentTermsCell.setNoWrap(false);
		  paymentTermsCell.setPhrase(new Phrase("Payment Terms",new Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0,0,0))));
		  dateInfoTable.addCell(paymentTermsCell);
		  
		  PdfPCell paymentTermsValueCell = new PdfPCell();
		  paymentTermsValueCell.setBackgroundColor(new BaseColor(255,255,255));
		  paymentTermsValueCell.setPadding(5);
		  paymentTermsValueCell.setNoWrap(false);
		  paymentTermsValueCell.setPhrase(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getPayment_terms(),new Font(FontFamily.HELVETICA, 13, Font.NORMAL, new BaseColor(0,0,0))));
		  dateInfoTable.addCell(paymentTermsValueCell);
		  
		  document.add(dateInfoTable);
		  document.add(new Paragraph(""));
		  
		  PdfPTable shippingInfoTable = new PdfPTable(4);
		  shippingInfoTable.setWidthPercentage(100);
		  shippingInfoTable.setWidths(new float[] {18f, 13f, 20f, 30f});
		  
		  PdfPCell shippingDateCell = new PdfPCell();
		  shippingDateCell.setBackgroundColor(new BaseColor(222,222,222));
		  shippingDateCell.setNoWrap(false);
		  shippingDateCell.setPhrase(new Phrase("Shipping Date",new Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(shippingDateCell);
		  
		  PdfPCell shippingDateValueCell = new PdfPCell();
		  shippingDateValueCell.setBackgroundColor(new BaseColor(255,255,255));
		  shippingDateValueCell.setPadding(5);
		  shippingDateValueCell.setNoWrap(false);
		  shippingDateValueCell.setPhrase(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getDelivery_due_date(),new Font(FontFamily.HELVETICA, 12, Font.NORMAL, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(shippingDateValueCell);
		  
		  PdfPCell shipmentTermsCell = new PdfPCell();
		  shipmentTermsCell.setBackgroundColor(new BaseColor(222,222,222));
		  shipmentTermsCell.setPadding(5);
		  shipmentTermsCell.setNoWrap(false);
		  shipmentTermsCell.setPhrase(new Phrase("Shipping Terms",new Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(shipmentTermsCell);
		  
		  PdfPCell shipmentTermsValueCell = new PdfPCell();
		  shipmentTermsValueCell.setBackgroundColor(new BaseColor(255,255,255));
		  shipmentTermsValueCell.setPadding(5);
		  shipmentTermsValueCell.setNoWrap(false);
		  shipmentTermsValueCell.setPhrase(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_terms(),new Font(FontFamily.HELVETICA, 13, Font.NORMAL, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(shipmentTermsValueCell);
		  
		  
		  document.add(shippingInfoTable);
		  
          document.add(new Paragraph(""));
		  
		  PdfPTable otherInfoTable = new PdfPTable(4);
		  shippingInfoTable.setWidthPercentage(100);
		  shippingInfoTable.setWidths(new float[] {18f, 13f, 20f, 30f});
		  
		  PdfPCell shippingModeCell = new PdfPCell();
		  shippingModeCell.setBackgroundColor(new BaseColor(222,222,222));
		  shippingModeCell.setNoWrap(false);
		  shippingModeCell.setPhrase(new Phrase("Shipping Mode",new Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(shippingModeCell);
		  
		  PdfPCell shippingModeValueCell = new PdfPCell();
		  shippingModeValueCell.setBackgroundColor(new BaseColor(255,255,255));
		  shippingModeValueCell.setPadding(5);
		  shippingModeValueCell.setNoWrap(false);
		  shippingModeValueCell.setPhrase(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_mode(),new Font(FontFamily.HELVETICA, 12, Font.NORMAL, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(shippingModeValueCell);
		  
		  PdfPCell creditTermsCell = new PdfPCell();
		  creditTermsCell.setBackgroundColor(new BaseColor(222,222,222));
		  creditTermsCell.setPadding(5);
		  creditTermsCell.setNoWrap(false);
		  creditTermsCell.setPhrase(new Phrase("Credit Terms",new Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(creditTermsCell);
		  
		  PdfPCell creditTermsValueCell = new PdfPCell();
		  creditTermsValueCell.setBackgroundColor(new BaseColor(255,255,255));
		  creditTermsValueCell.setPadding(5);
		  creditTermsValueCell.setNoWrap(false);
		  creditTermsValueCell.setPhrase(new Phrase(purchaseOrderBeanObj.getWhPurchaseOrder().getCredit_terms(),new Font(FontFamily.HELVETICA, 13, Font.NORMAL, new BaseColor(0,0,0))));
		  shippingInfoTable.addCell(creditTermsValueCell);
		  
		  
		  document.add(otherInfoTable);
		  
		  document.add(new Paragraph("\n"));
		  
		  document.add(new Phrase("Purchase Items",new Font(FontFamily.HELVETICA, 20, Font.BOLD, new BaseColor(193,88,59))));
		  document.add(new Paragraph(""));
		  PdfPTable itemsDetailsTable = new PdfPTable(5);
		  itemsDetailsTable.setWidthPercentage(100);
		  itemsDetailsTable.setWidths(new float[] {8f,18f, 20f, 16f, 15f});
		  document.add(new Paragraph("\n"));
		  
		// define items table header cell
		  PdfPCell numCell = new PdfPCell();
		  numCell.setBackgroundColor(new BaseColor(60,141,188));
		  numCell.setNoWrap(false);
		  //numCell.setBorderColor( new BaseColor(255,255,255));
		  numCell.setPhrase(new Phrase("No", new Font(FontFamily.HELVETICA, 13, Font.BOLD, new BaseColor(255,255,255))));
		  itemsDetailsTable.addCell(numCell);
		  
		  PdfPCell nameCell = new PdfPCell();
		  nameCell.setBackgroundColor(new BaseColor(60,141,188));
		  nameCell.setNoWrap(false);
		  //nameCell.setBorderColor( new BaseColor(255,255,255));
		  nameCell.setPhrase(new Phrase("Item Name", new Font(FontFamily.HELVETICA, 13, Font.BOLD, new BaseColor(255,255,255))));
		  itemsDetailsTable.addCell(nameCell);
		  
		  PdfPCell descCell = new PdfPCell();
		  descCell.setBackgroundColor(new BaseColor(60,141,188));
		  descCell.setNoWrap(false);
		 // descCell.setBorderColor( new BaseColor(255,255,255));
		  descCell.setPhrase(new Phrase("Description", new Font(FontFamily.HELVETICA, 13, Font.BOLD, new BaseColor(255,255,255))));
		  itemsDetailsTable.addCell(descCell);
		  
		  PdfPCell priceCell = new PdfPCell();
		  priceCell.setBackgroundColor(new BaseColor(60,141,188));
		  priceCell.setNoWrap(false);
		 // priceCell.setBorderColor( new BaseColor(255,255,255));
		  priceCell.setPhrase(new Phrase("Unit Price", new Font(FontFamily.HELVETICA, 13, Font.BOLD, new BaseColor(255,255,255))));
		  itemsDetailsTable.addCell(priceCell);
		  
		  PdfPCell qtyCell = new PdfPCell();
		  qtyCell.setBackgroundColor(new BaseColor(60,141,188));
		  qtyCell.setNoWrap(false);
		 // qtyCell.setBorderColor( new BaseColor(255,255,255));
		  qtyCell.setPhrase(new Phrase("Quantity", new Font(FontFamily.HELVETICA, 13, Font.BOLD, new BaseColor(255,255,255))));
		  itemsDetailsTable.addCell(qtyCell);
		  int i=1;
		  for (WHPurchaseOrderItems item : purchaseOrderBeanObj.getItemDetails()) {
			  itemsDetailsTable.addCell(String.valueOf(i));
			  itemsDetailsTable.addCell(item.getItemId());
			  itemsDetailsTable.addCell(item.getItemDesc());
			  itemsDetailsTable.addCell(String.valueOf(item.getItemPrice()));
			  itemsDetailsTable.addCell(String.valueOf(item.getQuantity()));
			  i++;
			}
		  document.add(itemsDetailsTable);
		  document.add(new Paragraph("\n"));
		  Paragraph shippingCost = new Paragraph("Shipping Cost\t\t\t\t : \t\t"+purchaseOrderBeanObj.getWhPurchaseOrder().getShipping_cost()); 
		  shippingCost.setAlignment(Element.ALIGN_RIGHT);
		  document.add(shippingCost);
		  document.add(new Paragraph("\n"));
		  Paragraph totaltax = new Paragraph("Tax\t\t\t\t\t\t\t\t : \t\t"+purchaseOrderBeanObj.getWhPurchaseOrder().getTotal_tax()); 
		  totaltax.setAlignment(Element.ALIGN_RIGHT);
		  document.add(totaltax);
		  document.add(new Paragraph("\n"));
		  Paragraph totalCost = new Paragraph("Total Cost\t\t\t\t : \t\t"+purchaseOrderBeanObj.getWhPurchaseOrder().getTotal_po_value()); 
		  totalCost.setAlignment(Element.ALIGN_RIGHT);
		  document.add(totalCost);
		  
		  document.add(new Paragraph("\n"));
		  Paragraph submittedBy = new Paragraph("Submitted by"); 
		  submittedBy.setAlignment(Element.ALIGN_LEFT);
		  document.add(submittedBy);
		  
		  Paragraph approvedBy = new Paragraph("Approved by"); 
		  approvedBy.setAlignment(Element.ALIGN_CENTER);
		  document.add(approvedBy);
		  
		  document.add(new Paragraph("\n"));
		  
		  
		  LineSeparator linesep = new LineSeparator(1, 20, new BaseColor(0,0,0), Element.ALIGN_LEFT, 0);
		  document.add(linesep);
		  
		  LineSeparator lineseprtr = new LineSeparator(1, 20, new BaseColor(0,0,0), Element.ALIGN_CENTER, 0);
		  document.add(lineseprtr);*/
		  
	}
	
	
	
	public static PdfPCell createImageCell(Image img) throws DocumentException, IOException {
	    PdfPCell cell = new PdfPCell(img, true);
	    cell.setBorder(Rectangle.NO_BORDER);
	    return cell;
	}
	
	public static PdfPCell createTextCell(String text) throws DocumentException, IOException {
	    PdfPCell cell = new PdfPCell();
	    cell.setVerticalAlignment(Element.ALIGN_TOP);
	    cell.setBorder(Rectangle.NO_BORDER);
	    cell.setPhrase(new Phrase(text,new Font(FontFamily.HELVETICA, 13, Font.NORMAL, BaseColor.LIGHT_GRAY)));
	    cell.setLeading(3f, 1.2f);
	    cell.setPaddingLeft(20);
	    return cell;
	}
	
	public static PdfPCell createNormalTextCell(String text,Font font,int alignment) throws DocumentException, IOException {
	    PdfPCell cell = new PdfPCell();
	    cell.setVerticalAlignment(alignment);
	    cell.setBorder(Rectangle.NO_BORDER);
	    cell.setPhrase(new Phrase(text,font));
//	    cell.setLeading(3f, 1.2f);
//	    cell.setPaddingLeft(20);
	    return cell;
	}

}
