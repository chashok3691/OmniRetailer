package com.tlabs.posweb.beans;
import java.util.List;

public class WareHouseGatepassResponse {

		private ResponseHeader responseHeader;
		private WarehouseGatepass gatePassObj;
		private List<WarehouseGatepass> gatePass;
		private List<WarehouseGatepassItems> gatePassItems;
		private int totalRecords;
		public List<WarehouseGatepassItems> getGatePassItems() {
			return gatePassItems;
		}

		public void setGatePassItems(List<WarehouseGatepassItems> gatePassItems) {
			this.gatePassItems = gatePassItems;
		}
		public ResponseHeader getResponseHeader() {
			return responseHeader;
		}

		public void setResponseHeader(ResponseHeader responseHeader) {
			this.responseHeader = responseHeader;
		}

		public WarehouseGatepass getGatePassObj() {
			return gatePassObj;
		}

		public void setGatePassObj(WarehouseGatepass gatePassObj) {
			this.gatePassObj = gatePassObj;
		}

		public List<WarehouseGatepass> getGatePass() {
			return gatePass;
		}

		public void setGatePass(List<WarehouseGatepass> gatePass) {
			this.gatePass = gatePass;
		}

		

		public int getTotalRecords() {
			return totalRecords;
		}

		public void setTotalRecords(int totalRecords) {
			this.totalRecords = totalRecords;
		}

	}



