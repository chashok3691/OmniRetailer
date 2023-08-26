package com.tlabs.posweb.beans;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
*/
/**
 * Created by Chaithanya on 4/27/2018.
 * Modified By SATYA NARAYAN SHUKLA on 18-10-2018
 */
/*@Entity
@Table(name="retail_service_area_map")
*/public class RetailServiceAreaMap {

 /*   @Id
    @Column(name="sno")
    @GeneratedValue(strategy = GenerationType.AUTO)*/
    private int slNo;

  /*  @Range(min=0,message="LATITUDE")
    @Column(name="latitude")*/
    private double latitude;

   /* @Range(min=0,message="LONGITUDE")
    @Column(name="longitude")*/
    private double longitude;

   /* @Length(max=50,message="AREA_CODE")
    @Column(name="area_code")*/
    private String area_code;
    
    
    


    public String getArea_code() {
        return area_code;
    }

    public void setArea_code(String area_code) {
        this.area_code = area_code;
    }

    public int getSlNo() {
        return slNo;
    }

    public void setSlNo(int slNo) {
        this.slNo = slNo;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }




}
