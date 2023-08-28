/**
 * 
 */
package com.tlabs.posweb.beans;

import java.util.List;



/**
 * @author naveenjilla
 *
 */
public class PriceRangeResponse {

	private ResponseHeader responseHeader;
	private List<PriceRangeMaster> priceRangeMasters;
	private List<PriceRangeChilds> priceRangeChilds;
	private int totalRecords;

	private PriceRangeMaster priceRangeMasterObj;
	
	

	public PriceRangeMaster getPriceRangeMasterObj() {
		return priceRangeMasterObj;
	}

	public void setPriceRangeMasterObj(PriceRangeMaster priceRangeMasterObj) {
		this.priceRangeMasterObj = priceRangeMasterObj;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<PriceRangeMaster> getPriceRangeMasters() {
		return priceRangeMasters;
	}

	public void setPriceRangeMasters(List<PriceRangeMaster> priceRangeMasters) {
		this.priceRangeMasters = priceRangeMasters;
	}

	public List<PriceRangeChilds> getPriceRangeChilds() {
		return priceRangeChilds;
	}

	public void setPriceRangeChilds(List<PriceRangeChilds> priceRangeChilds) {
		this.priceRangeChilds = priceRangeChilds;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	

}
