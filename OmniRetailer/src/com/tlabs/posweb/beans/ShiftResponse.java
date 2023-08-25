package com.tlabs.posweb.beans;

import java.util.List;



public class ShiftResponse {

	
	 private ResponseHeader responseHeader;

    private List<ShiftMaster> shifts;
    
    private ShiftMaster shiftMaster;

    private String totalRecords;

    private String shiftId;

    private List<ShiftMaster> shiftInfo;
    
	public ShiftMaster getShiftMaster() {
		return shiftMaster;
	}

	public void setShiftMaster(ShiftMaster shiftMaster) {
		this.shiftMaster = shiftMaster;
	}

	public List<ShiftMaster> getShiftInfo() {
		return shiftInfo;
	}

	public void setShiftInfo(List<ShiftMaster> shiftInfo) {
		this.shiftInfo = shiftInfo;
	}

	public List<ShiftMaster> getShifts() {
		return shifts;
	}

	public void setShifts(List<ShiftMaster> shifts) {
		this.shifts = shifts;
	}

	public ResponseHeader getResponseHeader ()
    {
        return responseHeader;
    }

    public void setResponseHeader (ResponseHeader responseHeader)
    {
        this.responseHeader = responseHeader;
    }

   
    public String getTotalRecords ()
    {
        return totalRecords;
    }

    public void setTotalRecords (String totalRecords)
    {
        this.totalRecords = totalRecords;
    }

    public String getShiftId ()
    {
        return shiftId;
    }

    public void setShiftId (String shiftId)
    {
        this.shiftId = shiftId;
    }

    
}
