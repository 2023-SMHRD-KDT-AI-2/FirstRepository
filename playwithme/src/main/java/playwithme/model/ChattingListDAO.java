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

	public String chatRoomTitle(int chatroom) {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		String title=sqlSession.selectOne("chatRoomTitle", chatroom);		
		sqlSession.close();
		return title;
	}
	
	   public int createRoom(ChattingListDTO chatlist) {
		      SqlSession sqlSession = sqlSessionFactory.openSession(true);
		      
		      int cnt = sqlSession.insert("createRoom", chatlist);
		      
		      sqlSession.insert("saveParticipant", chatlist);
		      
		      sqlSession.close();
		      
		      return cnt;   
		   }
	   
	   
	   public String createRoom2(ChattingListDTO chatlist) {
		      SqlSession sqlSession = sqlSessionFactory.openSession(true);
		      
		      int cnt = sqlSession.insert("createRoom", chatlist);
		      
		      sqlSession.insert("saveParticipant", chatlist);
		      
		      sqlSession.close();
		      
		      String boardchat=chatlist.getChatting_Room_num();
		      
		      
		      return boardchat;   
		   }
	   
	   public ArrayList<GetChatDTO> getChat(int roomnum) {
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			ArrayList<GetChatDTO> chatcontet=(ArrayList)sqlSession.selectList("getChat", roomnum);
		
			sqlSession.close();
			
			return chatcontet;
		
		}
	   
	   
	   public ArrayList<String> chatParti(int roomnum) {
		   SqlSession sqlSession = sqlSessionFactory.openSession(true);
		   
		   ArrayList<String> chatpart=(ArrayList)sqlSession.selectList("chatparti", roomnum);
		   sqlSession.close();
		   return chatpart;
	   }
	   
	   public String nName(String memberid) {
		   SqlSession sqlSession = sqlSessionFactory.openSession(true);
		   
		   String nName=sqlSession.selectOne("n_name", memberid);
		   sqlSession.close();
		   return nName;
	   }
	   
	   public int joinChat(ChatPartiDTO chatpart) {
		   SqlSession sqlSession = sqlSessionFactory.openSession(true);
		   
		   int cnt=sqlSession.insert("join_chat", chatpart);
		   sqlSession.close();
		   return cnt;
	   }
	   
	   public String checkparti (ChatPartiDTO chatpart) {
		   SqlSession sqlSession = sqlSessionFactory.openSession(true);
		   String check=sqlSession.selectOne("check_parti", chatpart);
		   sqlSession.close();
		   return check;
		   
	   }
	

}
