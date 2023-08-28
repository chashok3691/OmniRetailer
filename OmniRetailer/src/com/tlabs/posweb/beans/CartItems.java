package com.tlabs.posweb.beans;

import java.util.ArrayList;
import java.util.List;


/**
*Creation date:	20/01/2016
*Created by: Satheesh
*Last updated on:
*Updated by:
*Verified by:
*Purpose: This class contain the information about the cart.
*/
public class CartItems {
	private List<CartBean> cartItemsList;

	private Integer sno;
	
	
	private String cartId;

	private String skuId;
 

	private String pluCode; 
	
	private String uom;
	
	
	private String label;

	private float itemPrice;
	

	private float quantity;
 

	private float discountPrice;
	

	private float tax;

	private float totalPrice;
	

	private String productRange;
	
	private String measureRange;

	private String category;
	
	
	private String itemName;
	

	private String itemDescription;
	
	private String taxCode;
	
	private String userId;
	private String emailId;
	private String location;
	

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public float getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(float discountPrice) {
		this.discountPrice = discountPrice;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public CartItems(){
	cartItemsList = new ArrayList<CartBean>();
	}
	
	
	
	public List<CartBean> getCartItemsList() {
		return cartItemsList;
	}
	
	public void addToCart(CartBean cartBean){
		boolean isItemExist = false;
		if(!cartItemsList.isEmpty()){
			
		for(int i=0;i<cartItemsList.size();i++){
		
			
		if(cartBean.getPluCode().trim().equals(cartItemsList.get(i).getPluCode().trim())){
			//quantity
			//cartItemsList.remove(i);
			String quantity = cartItemsList.get(i).getRequiredQuantity().trim();
			System.out.println("quantity"+quantity);
			int qty = Integer.parseInt(quantity);
			//qty=0;
			int price=Integer.parseInt(cartItemsList.get(i).getTotalPrice());
			int finalQty = qty + Integer.parseInt(cartBean.getRequiredQuantity());
			//price=0;
			int total=price+Integer.parseInt(cartBean.getTotalPrice());
			
			cartItemsList.get(i).setTotalPrice(total+"");
			cartItemsList.get(i).setRequiredQuantity(finalQty+"");
			isItemExist = true;
		}	
		}
		if(!isItemExist)
			this.cartItemsList.add(cartBean);
		
	}else{
		this.cartItemsList.add(cartBean);
	}
		
	}
	public void updateCart(CartBean cartBean){
		if(!cartItemsList.isEmpty()){
			
		for(int i=0;i<cartItemsList.size();i++){
		
			
		if(cartBean.getPluCode().trim().equals(cartItemsList.get(i).getPluCode().trim())){
		
		/*	cartItemsList.set(i,cartBean);*/
		/*	String quantity = cartItemsList.get(i).getRequiredQuantity().trim();
			System.out.println("quantity"+quantity);
			int qty = Integer.parseInt(quantity);*/
			int price=Integer.parseInt(cartItemsList.get(i).getTotalPrice());
			int finalQty = Integer.parseInt(cartBean.getQuantity());
			int total=Integer.parseInt(cartBean.getProductPrice());
			
			cartItemsList.get(i).setTotalPrice(total+"");
			cartItemsList.get(i).setRequiredQuantity(finalQty+"");
			
		}	
		}
		
		
	}
		
	}
	public void deleteCartItem(CartBean cartBean){
		if(!cartItemsList.isEmpty()){
			
			for(int i=0;i<cartItemsList.size();i++){
			
			if(cartBean.getPluCode().trim().equals(cartItemsList.get(i).getPluCode().trim())&&(cartBean.getProductDescription().trim().equals(cartItemsList.get(i).getProductDescription().trim()))){
			
				cartItemsList.remove(i);
				
			}	
			}
			
		}
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
