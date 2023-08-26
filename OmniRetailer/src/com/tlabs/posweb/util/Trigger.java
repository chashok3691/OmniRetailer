package com.tlabs.posweb.util;

import java.util.Date;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SimpleTrigger;
//import org.quartz.impl.StdSchedulerFactory;
/*This Trigger class contains the triggering methods for the following jobs
 * timeBoundActivities Executor
 * timeBoundActivities Loader
 * (both instance specific and process specific)
 * */
public class Trigger {
  public void startExecutor(Scheduler scheduler) throws Exception{
	//System.out.println("startExecutor accessed");
    JobDetail job = new JobDetail();
  	job.setName("ExecutorJob");
  	job.setJobClass(Executor.class);

  	//configure the scheduler time
  	SimpleTrigger trigger =new SimpleTrigger();
  	trigger.setStartTime(new Date(System.currentTimeMillis() + 1000));
  	trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
  	
  	//1 minute
//  	trigger.setRepeatInterval(300*1000);
  	trigger.setRepeatInterval(200*1000);
    trigger.setName("ExecutorTrigger");
  	
    //schedule it
  	scheduler.start();
  	scheduler.scheduleJob(job,trigger);

  }
  
  
  
 }
