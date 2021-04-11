/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luanpaiva.tasklist.connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author luanp
 */
public class JpaUtil {

    private static final String PERSISTENCE_UNIT = "tasklistPU";
    private static EntityManagerFactory emf;

    public static EntityManager getEntityManager() {
        try {	
            emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
            return emf.createEntityManager();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
