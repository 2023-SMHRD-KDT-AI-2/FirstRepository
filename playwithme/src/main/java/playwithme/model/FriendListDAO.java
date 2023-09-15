package playwithme.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import playwithme.db.SqlSessionManager;

public class FriendListDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//ArrayList<ChattingListDTO> chatroom=new ArrayList<>();
	
	public ArrayList<String> friendlist(String member_id) {
		
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		ArrayList<String> friendcnt=(ArrayList)sqlSession.selectList("selectfriendlist", member_id);
		
		sqlSession.close();
		return friendcnt;
		
	}
}
