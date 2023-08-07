package action;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() { }
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
	Action action = null;
	switch(command) {
	
	case "plus": action = new PlusAction(); break;
	case "minus": action = new MinusAction(); break;
	case "multiply": action = new MultiplyAction(); break;
	case "divide": action = new DivideAction(); break;
	case "result": action = new ResultAction(); break;
	}
	return action;
	}
}
