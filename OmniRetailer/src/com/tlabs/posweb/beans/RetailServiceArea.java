package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
/*
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.Valid;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.tlabs.omniretailerservices.beans.RequestHeader;
import com.tlabs.omniretailerservices.beans.ResponseHeader;*/

/**
 * Created by Chaithanya on 4/27/2018.
 * Modified By SATYA NARAYAN SHUKLA on 18-10-2018
 */
/*@Entity
@Table(name="retail_service_area")*/
public class RetailServiceArea {

  /*  @Id
    @NotEmpty(message="AREA_CODE_NULL")
    @Length(max=50,message="AREA_CODE")
    @Column(name="area_code")*/
    private String area_code;

  /*  @Length(max=150,message="AREA_DESCRIPTION")
    @Column(name="area_description")*/
    private String area_description;

   /* @Length(max=150,message="AREA_CITY")
    @Column(name="city")*/
    private String city;
    
    private String defaultLocation;
    
    private String serviceAreaType;
    
    private int radius;
    
    public String getDefaultLocation() {
		return defaultLocation;
	}

	public void setDefaultLocation(String defaultLocation) {
		this.defaultLocation = defaultLocation;
	}

	public String getServiceAreaType() {
		return serviceAreaType;
	}

	public void setServiceAreaType(String serviceAreaType) {
		this.serviceAreaType = serviceAreaType;
	}

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}

	

    
    private String[] area_codes;
    
    
   public String[] getArea_codes() {
		return area_codes;
	}

	public void setArea_codes(String[] area_codes) {
		this.area_codes = area_codes;
	}

	/* @Length(max=150,message="AREA_ZONE")
    @Column(name="zone")*/
    private String zone;

 /*   @Length(max=50,message="AREA_USER")
    @Column(name="user_name")*/
    private String user_name;

 /*   @Length(max=50,message="AREA_ROLE")
    @Column(name="role_name")*/
    private String role_name;

//    @Column(name="created_date")
//    private Date created_date;

//    @Column(name="updated_date")
//    private Date updated_date;

//    @Column(name="status")
    private boolean status;
    
//    @Transient
    private RequestHeader requestHeader;
    
//    @Transient
    private ResponseHeader responseHeader;
    
//    @Transient
	private int totalRecords;
	
//	@Transient
	private int startIndex;
	
//	@Transient
	private int maxRecords;
	
	private boolean isRadiusSepcific;
	
	
	private String isRadiusSepcificFlag;
	
	private String priority;
	private String startDateStr;
	private String endDateStr;
	
	private String searchCritaria;
	
	private String createDateStr;
	
	 private List<ServiceAreaPinWise> serviceAreaPinWiseList;
//	@Transient
//	private String retailServiceAreaDetails;
	

	 
	 public boolean isRadiusSepcific() {
			return isRadiusSepcific;
		}

		public void setRadiusSepcific(boolean isRadiusSepcific) {
			this.isRadiusSepcific = isRadiusSepcific;
		}
		
	public String getCreateDateStr() {
		return createDateStr;
	}

	public List<ServiceAreaPinWise> getServiceAreaPinWiseList() {
		return serviceAreaPinWiseList;
	}

	public void setServiceAreaPinWiseList(List<ServiceAreaPinWise> serviceAreaPinWiseList) {
		this.serviceAreaPinWiseList = serviceAreaPinWiseList;
	}

	public String getIsRadiusSepcificFlag() {
		return isRadiusSepcificFlag;
	}

	public void setIsRadiusSepcificFlag(String isRadiusSepcificFlag) {
		this.isRadiusSepcificFlag = isRadiusSepcificFlag;
	}


	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public String getSearchCritaria() {
		return searchCritaria;
	}

	public void setSearchCritaria(String searchCritaria) {
		this.searchCritaria = searchCritaria;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	private List<RetailServiceArea> retailServiceAreaDetails;
	
    public List<RetailServiceAreaMap> getServiceAreaList() {
        return serviceAreaList;
    }

    public void setServiceAreaList(List<RetailServiceAreaMap> serviceAreaList) {
        this.serviceAreaList = serviceAreaList;
    }

   /* @Valid
    @OneToMany(cascade={CascadeType.ALL}, fetch=FetchType.LAZY)
    @JoinColumn(name="area_code")*/
    private List<RetailServiceAreaMap> serviceAreaList;

    public String getArea_code() {
        return area_code;
    }

    public void setArea_code(String area_code) {
        this.area_code = area_code;
    }

    public String getArea_description() {
        return area_description;
    }

    public void setArea_description(String area_description) {
        this.area_description = area_description;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZone() {
        return zone;
    }

    public void setZone(String zone) {
        this.zone = zone;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

/*    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public Date getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Date updated_date) {
        this.updated_date = updated_date;
    }
*/
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(int maxRecords) {
		this.maxRecords = maxRecords;
	}

	public List<RetailServiceArea> getRetailServiceAreaDetails() {
		return retailServiceAreaDetails;
	}

	public void setRetailServiceAreaDetails(List<RetailServiceArea> retailServiceAreaDetails) {
		this.retailServiceAreaDetails = retailServiceAreaDetails;
	}




}
