package com.tlabs.posweb.util;

import java.io.Serializable;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class ObjectLock implements Serializable,HttpSessionBindingListener {
    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println("valueBound:" + event.getName() + " session:" + event.getSession().getId());

    }

    public void registerSession() {
//        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put( "sessionBindingListener", this  );
        System.out.println( "registered sessionBindingListener"  );
    }

    public void valueUnbound(HttpSessionBindingEvent event) {
        System.out.println("valueUnBound:" + event.getName() + " session:" + event.getSession().getId() );
               // add you unlock code here:
//        clearLocksForSession( event.getSession().getId() );
    }
}