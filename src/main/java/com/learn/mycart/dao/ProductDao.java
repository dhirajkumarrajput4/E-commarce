
package com.learn.mycart.dao;

import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private SessionFactory factory;
    
    public ProductDao(SessionFactory factory)
    {
    this.factory=factory;
    }    
    
    public boolean saveProduct(Product product)
    {
        System.out.println("ProductDao is called");
        boolean f=false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            
            session.save(product);  //save product object
            
            tx.commit();
            session.close();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        System.out.println("Product saved: "+f);
        return f;
        
    }
    
    
    //Get All products
    
    public List<Product> getAllProduct()
    {
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Product");
        List<Product> list = q.list();
        return list;
    }
    
    public List<Product> getAllProductByCid(int Cid)
    {
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Product as p where p.category.categoryId=:id");
        q.setParameter("id", Cid);
        
        List<Product> list = q.list();
        return list;
    }
    
}
