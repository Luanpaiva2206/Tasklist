/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luanpaiva.tasklist.dao;

import com.luanpaiva.tasklist.connection.JpaUtil;
import com.luanpaiva.tasklist.model.Tasks;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author User
 */
public class TasksDAO {

    private EntityManager em;

    public TasksDAO() {
        try {
            em = JpaUtil.getEntityManager();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void saveTask(Tasks t) {
        try {
            em.getTransaction().begin();
            em.persist(t);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }

    public void deleteTask(int id) {
        try {
            em.getTransaction().begin();
            Tasks t = em.find(Tasks.class, id);
            em.remove(t);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }

    public void updateTask(int id) {
        try {
            em.getTransaction().begin();
            Tasks t = em.find(Tasks.class, id);
            t.setConcluida(Boolean.TRUE);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            em.close();
        }
    }

    public List<Tasks> findAll() {
        try {
            Query query = em.createQuery("SELECT t FROM Tasks t ORDER BY t.concluida");
            return query.getResultList();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
    }
}
