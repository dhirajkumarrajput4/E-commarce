package com.learn.mycart.dao;

import com.learn.mycart.entities.P_Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    //save the category to db
    public int saveCategory(P_Category cat) {
        
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int id = (int) session.save(cat);
        tx.commit();
        session.close();

        return id;
    }

    public List<P_Category> getCategory() {
        Session session = this.factory.openSession();

        Query q = session.createQuery("from P_Category");
        List<P_Category> list = q.list();
        return list;

    }

    public P_Category getCategoryById(int cid) {
        P_Category cat = null;
        try {

            Session session = this.factory.openSession();
            cat = session.get(P_Category.class, cid);
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

 

}
