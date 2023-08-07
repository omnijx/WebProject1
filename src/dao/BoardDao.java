package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.BoardDto;

public class BoardDao {
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw11";
		String dbPw = "pass1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		
		return conn;
}
	public BoardDto getBoardDto(int bno) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM board WHERE bno=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		BoardDto dto = null;
		if(rs.next()){
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			dto = new BoardDto(bno, title, content, writer, writedate);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	}
	
	public ArrayList<BoardDto> getBoardListByPageNum(int pageNum)throws Exception {
		ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
		Connection conn = getConnection();
		String sql = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT * FROM board ORDER BY bno DESC) b1) b2"
				+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
		int endNum = pageNum * 15;
		int startNum = endNum - 14;
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNum);
		pstmt.setInt(2, endNum);

		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String content = "";
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			BoardDto dto = new BoardDto(bno, title, content, writer, writedate);
			boardList.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return boardList;
}
}
