package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class P_Category {
    @Id
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    @Column(name="CATEGORY_ID")
    private int categoryId;
    @Column(name="CATEGORY_TITLE")
    private String categoryTitle;
    @Column(name="CATEGORY_DESCRIPTION",length=1500)
    private String categoryDescription;
    
    @OneToMany(mappedBy="category")
    private List<Product> products=new ArrayList<>();

    //CONTRUCTOR WITH ALL
    public P_Category(int categoryId, String categoryTitle, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
    }
    
    //CONTRUCTOR WITHOUT categoryId
    public P_Category(String categoryTitle, String categoryDescription,List<Product> products) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }
    
    
    //DEFOULT
    public P_Category() {
    }
    public int getCategoryId() {
        return categoryId;
    }

    //Getter and setter
    
    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }


    
    //TOSTRING METHOD
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription=" + categoryDescription + '}';
    }
    
    
    
    
    
    
}
