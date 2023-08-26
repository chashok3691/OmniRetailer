package com.tlabs.posweb.util;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
public class HeaderFooterPageEvent extends PdfPageEventHelper {
  /*  public void onStartPage(PdfWriter writer,Document document) {
    	Rectangle rect = writer.getBoxSize("art");
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Top Left"), rect.getLeft(), rect.getTop(), 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Top Right"), rect.getRight(), rect.getTop(), 0);
    }*/
    public void onEndPage(PdfWriter writer,Document document) {
    	Rectangle rect = new Rectangle(40, 40, 520, 800);
    	//System.out.println("Top:::::"+rect.getTop());
    	//System.out.println("Left::::"+rect.getLeft());
    	//System.out.println("Right:::"+rect.getRight());
    	//System.out.println("Bottom::"+rect.getBottom());
//    	Rectangle rect = writer.getBoxSize("art");
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Thank you"), rect.getLeft(), rect.getBottom(), 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Proprieter Signature"), rect.getRight(), rect.getBottom(), 0);
    }
} 