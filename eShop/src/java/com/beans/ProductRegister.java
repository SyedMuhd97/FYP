/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author acer
 */
public class ProductRegister {
private int id;
	private String name;
	private String price;
	private String category;
	private String featured;
	private String image;
         private String userId;
        private String qty;
        private String pRegisterStatus;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }
        
        

  
        
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFeatured() {
		return featured;
	}
	public void setFeatured(String featured) {
		this.featured = featured;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

    public String getpRegisterStatus() {
        return pRegisterStatus;
    }

    public void setpRegisterStatus(String pRegisterStatus) {
        this.pRegisterStatus = pRegisterStatus;
    }
        
        
        
	@Override
	public String toString() {
		return "ProductRegister [id=" + id + ", name=" + name + ", price=" + price + ", category=" + category +", qty=" + qty +", userId=" + userId+", featured="
				+ featured + ", pRegisterStatus=" + pRegisterStatus +", image=" + image + "]";
	}
        
	
        
	
        
	
 




}








