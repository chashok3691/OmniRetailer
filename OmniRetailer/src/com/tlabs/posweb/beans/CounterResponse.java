package com.tlabs.posweb.beans;

import java.util.List;



public class CounterResponse {

	private String counterId;
	private ResponseHeader responseHeader;
	private List<Counter> counters;
	private Counter counter;
	private int totalRecords;
	
	
	
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getCounterId() {
		return counterId;
	}
	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public List<Counter> getCounters() {
		return counters;
	}
	public void setCounters(List<Counter> counters) {
		this.counters = counters;
	}
	public Counter getCounter() {
		return counter;
	}
	public void setCounter(Counter counter) {
		this.counter = counter;
	}
	
	
}
