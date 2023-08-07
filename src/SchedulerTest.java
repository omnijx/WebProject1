import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class SchedulerTest {
	public void scheduler() throws Exception {
		SchedulerFactory sf = new StdSchedulerFactory();
		Scheduler sched = sf.getScheduler();
		JobDetail job = JobBuilder.newJob(MyJob.class)
									.withIdentity("myjob", "group1")
									.build();
		Trigger trigger = TriggerBuilder.newTrigger()
									.withIdentity("myTrigger", "group1")
									.startNow()
									.withSchedule(SimpleScheduleBuilder.simpleSchedule()
												.withIntervalInSeconds(3)
												.repeatForever())
									.build();
		sched.scheduleJob(job, trigger);
		sched.start();
		Thread.sleep(10000);
		sched.shutdown();
	}
}
