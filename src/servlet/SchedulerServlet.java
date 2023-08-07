package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

@WebServlet("/SchedulerServlet")
public class SchedulerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answer = request.getParameter("command");
		Scheduler sched = null;
		if(answer=="start") {
			
		try {
			SchedulerFactory sf = new StdSchedulerFactory();
			sched = sf.getScheduler();
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
//			sched.shutdown();
			response.sendRedirect("Scheduler.jsp");
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("전송");
		}
		if(answer=="end") {
			try {
				sched.shutdown();
			} catch (SchedulerException e) {
				e.printStackTrace();
			}
		}
	}
	}

