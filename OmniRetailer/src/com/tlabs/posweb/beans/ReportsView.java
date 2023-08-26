package com.tlabs.posweb.beans;

import java.util.List;

/**
 * @author Mythri
 *
 */
public class ReportsView {

	private List<String> columnNames;
	private String reportHeading;
	private String reportHeading1;
	private String reportHeading2;
	private List<List<String>> resultList;
	private String footerStr;
	private String dateStr;
	private String idStr;
	private List<String> keys;
	private List<String> values;

	public List<String> getKeys() {
		return keys;
	}
	public void setKeys(List<String> keys) {
		this.keys = keys;
	}
	public List<String> getValues() {
		return values;
	}
	public void setValues(List<String> values) {
		this.values = values;
	}
	public String getIdStr() {
		return idStr;
	}
	public void setIdStr(String idStr) {
		this.idStr = idStr;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public String getFooterStr() {
		return footerStr;
	}
	public void setFooterStr(String footerStr) {
		this.footerStr = footerStr;
	}
	public String getReportHeading2() {
		return reportHeading2;
	}
	public void setReportHeading2(String reportHeading2) {
		this.reportHeading2 = reportHeading2;
	}
	public List<String> getColumnNames() {
		return columnNames;
	}
	public void setColumnNames(List<String> columnNames) {
		this.columnNames = columnNames;
	}
	public String getReportHeading() {
		return reportHeading;
	}
	public void setReportHeading(String reportHeading) {
		this.reportHeading = reportHeading;
	}
	public String getReportHeading1() {
		return reportHeading1;
	}
	public void setReportHeading1(String reportHeading1) {
		this.reportHeading1 = reportHeading1;
	}
	public List<List<String>> getResultList() {
		return resultList;
	}
	public void setResultList(List<List<String>> resultList) {
		this.resultList = resultList;
	}
}
