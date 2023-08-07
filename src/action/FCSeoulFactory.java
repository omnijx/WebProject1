package action;

public class FCSeoulFactory {
	private static FCSeoulFactory instance = new FCSeoulFactory();
	private FCSeoulFactory() { }
	public static FCSeoulFactory getInstance() {
		return instance;
	}
	public FCSeoul getFCSeoul(String command) {
		FCSeoul fcseoul = null;
		switch(command) {
		
		case "main": fcseoul = new MainPageAction(); break;
		case "photo": fcseoul = new PhotoMainAction(); break;
		case "photoDetail": fcseoul = new PhotoDetailAction(); break;
		case "notice": fcseoul = new NoticeMainAction(); break;
		case "noticeDetail": fcseoul = new NoticeDetailAction(); break;
		case "noticeWritePage": fcseoul = new NoticeWritePageAction(); break;
		case "noticeWrite": fcseoul = new NoticeWriteAction(); break;
		case "noticeDelete": fcseoul = new NoticeDeleteAction(); break;
		case "noticeUpdatePage": fcseoul = new NoticeUpdatePageAction(); break;
		case "noticeUpdate": fcseoul = new NoticeUpdateAction(); break;
		case "login": fcseoul = new LoginmainAction(); break;
		case "loginAction": fcseoul = new LoginAction(); break;
		case "logout": fcseoul = new LogoutAction(); break;
		case "join1": fcseoul = new Join1Action(); break;
		case "join2": fcseoul = new Join2Action(); break;
		case "join3": fcseoul = new Join3Action(); break;
		case "join4": fcseoul = new Join4Action(); break;
		case "register": fcseoul = new JoinRegisterAction(); break;
		case "idCheck": fcseoul = new IdCheckAction(); break;
		case "nickCheck": fcseoul = new NickCheckAction(); break;
		case "myPage": fcseoul = new MyPageAction(); break;
		case "memberCheckUpdate": fcseoul = new MemberCheckAction(); break;
		case "memberPass": fcseoul = new MemberPassAction(); break;
		case "updatePage": fcseoul = new UpdatePageAction(); break;
		case "memberUpdatePage": fcseoul = new MemberUpdatePageAction(); break;
		case "memberCheckSecession": fcseoul = new MemberSecessionPageAction(); break;
		case "memberPassSecession": fcseoul = new MemberSecessionAction();
		}
		return fcseoul;
		}

}
