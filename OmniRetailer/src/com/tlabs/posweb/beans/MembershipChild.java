package com.tlabs.posweb.beans;



/*@Entity
@Table(name="memberships")*/
public class MembershipChild {
	
/*	@Id
	@Column(name="membership_code")*/
	private String membershipCode;
	
/*	@Column(name="membership_program_code")*/
	private String membershipProgramCode;
	
/*	@Column(name="assigned_status")*/
	private boolean assignedStatus;
	
	private String assignedStatusstr;
	
	private int isAutoRenewal;
	private int isOnline;
    private String name;
	private String renewalDateStr;
	
	
	
	
	
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRenewalDateStr() {
		return renewalDateStr;
	}

	public void setRenewalDateStr(String renewalDateStr) {
		this.renewalDateStr = renewalDateStr;
	}

	public int getIsAutoRenewal() {
		return isAutoRenewal;
	}

	public void setIsAutoRenewal(int isAutoRenewal) {
		this.isAutoRenewal = isAutoRenewal;
	}

	public int getIsOnline() {
		return isOnline;
	}

	public void setIsOnline(int isOnline) {
		this.isOnline = isOnline;
	}

	private String filePath;
	
	
	private boolean status;
	
	private String  statusstr;
	
	
	
	
 public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/*	@Column(name="membership_status")*/
	private boolean membershipStatus;
	
	private String membershipStatusstr;
	
/*	@Column(name="membership_id")*/	
	private String membershipId;
	
	public String getMembershipCode() {
		return membershipCode;
	}
	
	public void setMembershipCode(String membershipCode) {
		this.membershipCode = membershipCode;
	}

	public String getMembershipProgramCode() {
		return membershipProgramCode;
	}

	public void setMembershipProgramCode(String membershipProgramCode) {
		this.membershipProgramCode = membershipProgramCode;
	}

	public boolean isAssignedStatus() {
		return assignedStatus;
	}

	public void setAssignedStatus(boolean assignedStatus) {
		this.assignedStatus = assignedStatus;
	}

	public boolean isMembershipStatus() {
		return membershipStatus;
	}

	public void setMembershipStatus(boolean membershipStatus) {
		this.membershipStatus = membershipStatus;
	}

	public String getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(String membershipId) {
		this.membershipId = membershipId;
	}

	public String getAssignedStatusstr() {
		return assignedStatusstr;
	}

	public void setAssignedStatusstr(String assignedStatusstr) {
		this.assignedStatusstr = assignedStatusstr;
	}

	public String getStatusstr() {
		return statusstr;
	}

	public void setStatusstr(String statusstr) {
		this.statusstr = statusstr;
	}

	public String getMembershipStatusstr() {
		return membershipStatusstr;
	}

	public void setMembershipStatusstr(String membershipStatusstr) {
		this.membershipStatusstr = membershipStatusstr;
	}
	
	

}
