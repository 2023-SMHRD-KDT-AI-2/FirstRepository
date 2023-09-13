package playwithme.model;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import playwithme.db.SqlSessionManager;


public class ChattingListDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//ArrayList<ChattingListDTO> chatroom=new ArrayList<>();
	
	public ArrayList<ChattingListDTO> chatlist(String member_id) {
		
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		ArrayList<ChattingListDTO> chatroom=(ArrayList)sqlSession.selectList("selectChatTitle", member_id);
		
		sqlSession.close();
		return chatroom;
		
	}
	
	public String lastCaht(int room_num) {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		String lastChat=sqlSession.selectOne("lastChat", room_num);
		
		sqlSession.close();
		return lastChat;
	}
	

}
