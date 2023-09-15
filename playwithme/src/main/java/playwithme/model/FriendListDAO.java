/*
 * 2023.09.15
 * 박기원
 * 목적 친구 리스트 불러오기 및 친구 추가
 */



package playwithme.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import playwithme.db.SqlSessionManager;

public class FriendListDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessoin();
	
	//ArrayList<ChattingListDTO> chatroom=new ArrayList<>();
	
	public ArrayList<String> friendlist(String member_id) {
		
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		ArrayList<String> friendcnt=(ArrayList)sqlSession.selectList("selectfriendlist", member_id);
		
		sqlSession.close();
		return friendcnt;
		
	}

	public int friendAdd(FriendListDTO frienddto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("friendAdd", frienddto);
		sqlSession.close();
		
		return cnt;   
	 }

}
