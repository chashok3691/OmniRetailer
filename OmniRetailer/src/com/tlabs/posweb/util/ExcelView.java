package com.tlabs.posweb.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.tlabs.posweb.beans.ReportsView;

public class ExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) {
		
		// get data model which is passed by the Spring container
		ReportsView view = (ReportsView) model.get("excelList");
				
		Sheet sheet = workbook.createSheet("sheet 1");
		
		Row row = null;
		Cell cell = null;
		int r = 0;
		int c = 0;
		
		//Style for header cell
		CellStyle style = workbook.createCellStyle();
		style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setAlignment(CellStyle.ALIGN_GENERAL);
		
		//Create header cells
		row = sheet.createRow(r++);
		for(String columnName : view.getColumnNames()) {
			cell = row.createCell(c++);
			cell.setCellStyle(style);
			cell.setCellValue(columnName);
		}
		
		//Create data cell
		for(List<String> rowsList : view.getResultList()) {
			row = sheet.createRow(r++);
			c = 0;
			for(String value : rowsList) {
				row.createCell(c++).setCellValue(value);
			}
		}

		for(int i = 0 ; i < view.getColumnNames().size(); i++) {
			sheet.autoSizeColumn(i, true);
		}
		
	}
	
	

}
