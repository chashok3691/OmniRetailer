package com.tlabs.posweb.beans;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
*/
/*@Entity
@Table(name="tax_locations")
*/public class TaxLocations {
	
	/*@Id
	@Column(name="sno")
	@GeneratedValue(strategy=GenerationType.AUTO)*/ 
	private int sno;
	

//	@Column(name="tax_code")
	private String tax_code;
	
	
//	@Column(name="store_location")
	private String store_location;


	/**
	 * @return the sno
	 */
	public int getSno() {
		return sno;
	}


	/**
	 * @param sno the sno to set
	 */
	public void setSno(int sno) {
		this.sno = sno;
	}


	/**
	 * @return the tax_code
	 */
	public String getTax_code() {
		return tax_code;
	}


	/**
	 * @param tax_code the tax_code to set
	 */
	public void setTax_code(String tax_code) {
		this.tax_code = tax_code;
	}


	/**
	 * @return the store_location
	 */
	public String getStore_location() {
		return store_location;
	}


	/**
	 * @param store_location the store_location to set
	 */
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	
	
	

}
