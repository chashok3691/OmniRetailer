package com.tlabs.posweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tlabs.posweb.beans.ReportsView;
import com.tlabs.posweb.beans.SalesReport;

@Controller
@RequestMapping(value="/excel")
public class ExcelController {
	// private static Logger log = Logger.getLogger(ExcelController.class);
		
		private ModelAndView modelAndViewObj;
		
		@SuppressWarnings("unchecked")
		@RequestMapping(value="/taxReport")
//		public ModelAndView taxReport(@RequestBody SalesReport salesReportobj,HttpServletRequest request,HttpServletResponse response){
		public ModelAndView taxReport(HttpServletRequest request,HttpServletResponse response){
			//log.info("Calling generatePdf()...");
			  try{
				  //Response will come from webservices. For Generating Purchase Order template, placing static values
				  SalesReport salesReportobj = new SalesReport();
				  //////System.out.println(request.getSession().getAttribute("reportList"));
				  salesReportobj.setReportsList((List<SalesReport>)request.getSession().getAttribute("reportList"));
				  response.setContentType("application/pdf");
				  ReportsView reportsView = new ReportsView();
				  List<String> columnNames = new ArrayList<String>();
				  columnNames.add("Date");
				  columnNames.add("G.T.O");
				  columnNames.add("5% Sales");
				  columnNames.add("Sales Tax 5%");
				  columnNames.add("14.5% Sales");
				  columnNames.add("Sales Tax 14.5%");
				  columnNames.add("Exempted Sales");
				  columnNames.add("Tax Amount");
				  reportsView.setColumnNames(columnNames);
				  String reportHeading = "TAX REPORTS";
				  reportsView.setReportHeading(reportHeading);
				  List<List<String>> resultList = new ArrayList<List<String>>();
				  if(salesReportobj.getReportsList() != null)
				  for(SalesReport salesReport : salesReportobj.getReportsList()){
					  List<String> result = new ArrayList<String>();
					  result.add(salesReport.getDate());
					  result.add(salesReport.getGto());
					  result.add(salesReport.getSales5());
					  result.add(salesReport.getSalesTax5());
					  result.add(salesReport.getSales145());
					  result.add(salesReport.getSalesTax145());
					  result.add(salesReport.getExempted());
					  result.add(salesReport.getTodayTotal());
					  resultList.add(result);
				  }
				  List<String> result = new ArrayList<String>();
				  result.add("");
				  if(salesReportobj.getReportsList() != null && salesReportobj.getReportsList().size() > 0){
					  result.add(salesReportobj.getReportsList().get(0).getGrossGto());
					  result.add(salesReportobj.getReportsList().get(0).getGrossSales5());
					  result.add(salesReportobj.getReportsList().get(0).getGrossSalesTax5());
					  result.add(salesReportobj.getReportsList().get(0).getGrossSales145());
					  result.add(salesReportobj.getReportsList().get(0).getGrossSalesTax145());
					  result.add(salesReportobj.getReportsList().get(0).getGrossExempted());
					  result.add(salesReportobj.getReportsList().get(0).getGrossTodayTotal());
					  resultList.add(result);
				  }
				  reportsView.setResultList(resultList);
				  modelAndViewObj = new ModelAndView("excelView", "excelList",reportsView);
			  }catch(Exception e){
				  e.printStackTrace();
			  }
			  return modelAndViewObj;
		}
}
