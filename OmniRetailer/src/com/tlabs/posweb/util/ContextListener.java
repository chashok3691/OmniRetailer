package com.tlabs.posweb.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.impl.StdSchedulerFactory;
/**
 * Application Lifecycle Listener implementation class Initialization
 *
 * when start/re-start engine should fill  subscribedSignals collection object
 */
public final class ContextListener implements ServletContextListener {
    /**
     * Default constructor. 
     */
	private Scheduler scheduler = null;
	  public ContextListener() {
        // TODO Auto-generated constructor stub
    }
    @Override
    public void contextInitialized(ServletContextEvent sce) {      
     try {   	
      Trigger trigger=new Trigger();
      scheduler = new StdSchedulerFactory().getScheduler();
      trigger.startExecutor(scheduler);
      
    }
    catch(Exception e) {
    	e.printStackTrace();
    }
    }

 	@Override
    public void contextDestroyed(ServletContextEvent sce) {  
      //release all the locks during engine shutdown 
  	  try {
		scheduler.shutdown();
	} catch (SchedulerException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    }   
    

}
