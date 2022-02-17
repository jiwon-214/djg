package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() { //실제로 MySQL에 접속해주는 부분
		try {
			String dbURL = "jdbc:mysql://localhost:3306/DJG?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "twins5302";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//로그인 시도해주는 함수
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; //명령을 사용해서 가져온다
		try {
			pstmt = conn.prepareStatement(SQL);//SQL 문장을 데이터베이스에 삽입하는
			pstmt.setString(1, userID); //중요, SQL 해킹 기법 방어하기 위한 수단으로 preapredStatement 사용하는데 하나의 문장 준비해놓고 ? 넣어놓고 ?에 해당하는 내용으로 userID를 넣어줌. 실제 데이터베이스에는 사용자 아이디 입력받아서 실제로 존재하는지 존재한다면 비밀번호가 뭔지 가져오도록 하는 것
			rs = pstmt.executeQuery();
			if (rs.next()) { //결과 존재하면
				if(rs.getString(1).equals(userPassword))  //결과가 동일하다면(비밀번호랑 접속시도한 비밀번호 일치하면)
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			rs.close();
			return -1; //아이디가 없다
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return -2; //데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());;
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserMajor());
			pstmt.setString(6, user.getUserYear());
			pstmt.setString(7, user.getUserGrade());
			pstmt.setString(8, user.getUserLgrade());
			pstmt.setString(9, user.getUserMchild());
			pstmt.setString(10, user.getUserIncome());
			pstmt.setString(11, user.getUserVol());
			pstmt.setString(12, user.getUserMentor());
			pstmt.setString(13, user.getUserExam());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}

	public User djg(String userID) throws SQLException {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		User user = null;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 user = new User();
				 user.setUserID(rs.getString("userID"));
				 user.setUserPassword(rs.getString("userPassword"));
		         user.setUserName(rs.getString("userName"));
		         user.setUserEmail(rs.getString("userEmail"));
		         user.setUserMajor(rs.getString("userMajor"));
		         user.setUserYear(rs.getString("userYear"));
		         user.setUserGrade(rs.getString("userGrade"));
		         user.setUserLgrade(rs.getString("userLgrade"));
		         user.setUserMchild(rs.getString("userMchild"));
		         user.setUserIncome(rs.getString("userIncome"));
		         user.setUserVol(rs.getString("userVol"));
		         user.setUserMentor(rs.getString("userMentor"));
		         user.setUserExam(rs.getString("userExam"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			   if(rs!=null)	try{rs.close();}catch(SQLException ex){}
			   if(pstmt!=null)	try{pstmt.close();}catch(SQLException ex){}
			   if(conn!=null)	try{conn.close();}catch(SQLException ex){}
			  }
		return user;
	}


	public boolean modification(User user) throws SQLException {
		boolean b = false;
		String SQL = "UPDATE USER SET userPassword = ?, userMajor = ?, userYear = ?, userGrade = ?, userLgrade = ?, userMchild = ?, userIncome = ?, userVol = ?, userMentor = ?, userExam = ? WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserMajor());
			pstmt.setString(3, user.getUserYear());
			pstmt.setString(4, user.getUserGrade());
			pstmt.setString(5, user.getUserLgrade());
			pstmt.setString(6, user.getUserMchild());
			pstmt.setString(7, user.getUserIncome());
			pstmt.setString(8, user.getUserVol());
			pstmt.setString(9, user.getUserMentor());
			pstmt.setString(10, user.getUserExam());
			pstmt.setString(11, user.getUserID());
			if(pstmt.executeUpdate() > 0)
				b = true;
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			   if(rs!=null)	try{rs.close();}catch(SQLException ex){}
			   if(pstmt!=null)	try{pstmt.close();}catch(SQLException ex){}
			   if(conn!=null)	try{conn.close();}catch(SQLException ex){}
			  }
		return b;
	}

	public String findid(String userName, String userEmail) {
		String SQL = "SELECT userID FROM USER WHERE userName = ? AND userEmail = ?"; //명령을 사용해서 가져온다
		String userID = null;
		try {
			pstmt = conn.prepareStatement(SQL);//SQL 문장을 데이터베이스에 삽입하는
			pstmt.setString(1, userName); //중요, SQL 해킹 기법 방어하기 위한 수단으로 preapredStatement 사용하는데 하나의 문장 준비해놓고 ? 넣어놓고 ?에 해당하는 내용으로 userID를 넣어줌. 실제 데이터베이스에는 사용자 아이디 입력받아서 실제로 존재하는지 존재한다면 비밀번호가 뭔지 가져오도록 하는 것
			pstmt.setString(2, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) { //결과 존재하면
				userID = rs.getString("userID");
			}
			else {
				userID = null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return userID;
	}
	
	public String findpw(String userID, String userName, String userEmail) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ? AND userName = ? AND userEmail = ?"; //명령을 사용해서 가져온다
		String userPassword = null;
		try {
			pstmt = conn.prepareStatement(SQL);//SQL 문장을 데이터베이스에 삽입하는
			pstmt.setString(1, userID); //중요, SQL 해킹 기법 방어하기 위한 수단으로 preapredStatement 사용하는데 하나의 문장 준비해놓고 ? 넣어놓고 ?에 해당하는 내용으로 userID를 넣어줌. 실제 데이터베이스에는 사용자 아이디 입력받아서 실제로 존재하는지 존재한다면 비밀번호가 뭔지 가져오도록 하는 것
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) { //결과 존재하면
				userPassword = rs.getString("userPassword");
			}
			else {
				userPassword = null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return userPassword;
	}
	
	public boolean delete(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					String delSQL = "DELETE FROM USER WHERE userID = ?";
					pstmt = conn.prepareStatement(delSQL);
					pstmt.setString(1, userID);
					pstmt.executeUpdate();
					result = true;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch(SQLException ex) {}
			try {pstmt.close();} catch(SQLException ex) {}
			try {conn.close();} catch(SQLException ex) {}
		}
		return result;
	}
}
	