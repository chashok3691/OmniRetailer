/**
 * @author naveenjilla
 *
 */
package com.tlabs.posweb.beans;

import java.util.List;

public class DenominationMasterResponse {

	private ResponseHeader responseHeader;
	private DenominationMaster denominationMaster;
	private List<DenominationMaster> denominationMasters;
	private int totalRecords;

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public DenominationMaster getDenominationMaster() {
		return denominationMaster;
	}

	public void setDenominationMaster(DenominationMaster denominationMaster) {
		this.denominationMaster = denominationMaster;
	}

	public List<DenominationMaster> getDenominationMasters() {
		return denominationMasters;
	}

	public void setDenominationMasters(List<DenominationMaster> denominationMasters) {
		this.denominationMasters = denominationMasters;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

}
