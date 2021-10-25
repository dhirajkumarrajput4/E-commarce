package com.learn.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="PRODUCT_ID")
    private int productId;
    
    @Column(name="PRODUCT_NAME")
    private String productName;
    
    @Column(name="PRODUCT_DESCRIPTION", length=3000)
    private String productDescription;
    
    @Column(name="PRODUCT_PHOTO")
    private String productPhoto;
    
    @Column(name="PRODUCT_PRICE")
    private int productPrice;
    
    @Column(name="PRODUCT_DISCOUNT")
    private int productDiscount;
    
    @Column(name="PRODUCT_QUANTITY")
    private int producctQuantity;
    
    @ManyToOne
    private P_Category category;

    
    //DEFAULT
    public Product() {
    }

    public Product(String productName, String productDescription, String productPhoto, int productPrice, int productDiscount, int producctQuantity,P_Category category) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPhoto = productPhoto;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.producctQuantity = producctQuantity;
        this.category=category;
    }

    
    
    //GETTER AND SETTER
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProducctQuantity() {
        return producctQuantity;
    }

    public void setProducctQuantity(int producctQuantity) {
        this.producctQuantity = producctQuantity;
    }

    public P_Category getCategory() {
        return category;
    }

    public void setCategory(P_Category category) {
        this.category = category;
    }
    

    
    //TOSTRING METHOD
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDescription=" + productDescription + ", productPhoto=" + productPhoto + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount + ", producctQuantity=" + producctQuantity + '}';
    }

//    Calculate price after discount
    
    public int getPriceAfterApplyingDiscount()
    {
            int d=(int)((this.getProductDiscount()/100.0)*this.getProductPrice());
            
            System.out.println("Product final price:"+(this.getProductPrice()-d));
            
            return this.getProductPrice()-d;
            
            
    }

    
    
    
    
    
}
