package com.tlabs.posweb.beans;




import java.math.BigDecimal;

/**
 * Created by Chaithanya on 4/23/2018.
 */


public class LoyaltyPurchaseRanges {


  
    private int sno;

 
    private String loyalityProgramNumber;


    
    private float minPurchaseValue;

 
    private float maxPurchaseValue;

 
    private String rewardCriteria;
   
    private String rewardType;

  public String getRewardCriteria() {
		return rewardCriteria;
	}

	public void setRewardCriteria(String rewardCriteria) {
		this.rewardCriteria = rewardCriteria;
	}

	
    private BigDecimal rewardValue;

   

   

    public float getMinPurchaseValue() {
		return minPurchaseValue;
	}

	public void setMinPurchaseValue(float minPurchaseValue) {
		this.minPurchaseValue = minPurchaseValue;
	}

	public float getMaxPurchaseValue() {
		return maxPurchaseValue;
	}

	public void setMaxPurchaseValue(float maxPurchaseValue) {
		this.maxPurchaseValue = maxPurchaseValue;
	}

	public String getLoyalty_program_number() {
		return loyalty_program_number;
	}

	public void setLoyalty_program_number(String loyalty_program_number) {
		this.loyalty_program_number = loyalty_program_number;
	}

	public String getLoyalityProgramNumber() {
        return loyalityProgramNumber;
    }

    public void setLoyalityProgramNumber(String loyalityProgramNumber) {
        this.loyalityProgramNumber = loyalityProgramNumber;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

	public BigDecimal getRewardValue() {
		return rewardValue;
	}

	public void setRewardValue(BigDecimal rewardValue) {
		this.rewardValue = rewardValue;
	}

	public String getRewardType() {
		return rewardType;
	}

	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}


	 private String loyalty_program_number;


}
