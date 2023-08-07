package action;


public class SchedulerFactoryTest {
	
	private SchedulerFactoryTest() {} // 프라이빗 생성자
	
	private static SchedulerFactoryTest instance = new SchedulerFactoryTest(); //
	
	public static SchedulerFactoryTest getInstance() {
		return instance;
	}
	
	public Scheduler action(String command) {
		Scheduler action = null;
		switch(command) {
		case "start": action = new SchedulerStartAction(); break;
		case "end": action = new SchedulerEndAction(); break;
		}
		return action;
	}
}
