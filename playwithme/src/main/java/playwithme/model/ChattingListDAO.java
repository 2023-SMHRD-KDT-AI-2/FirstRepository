package playwithme.model;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import playwithme.db.SqlSessionManager;


public class ChattingListDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessoin();
	
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
	   

	   //친구 추가할때 방 생성
	   public String createRoom3(ChattingListDTO chatlist) {
		      SqlSession sqlSession = sqlSessionFactory.openSession(true);
		      
		      sqlSession.insert("createRoom", chatlist);


		      sqlSession.insert("saveParticipant", chatlist);
		      
		      sqlSession.close();
		      
		      String friendchat = chatlist.getChatting_Room_num();


		      return friendchat;   
		   }
	   
	   //친구 초대
	   public void inviteFriendToChatRoom(FriendListDTO friendListDTO) {
		    SqlSession sqlSession = sqlSessionFactory.openSession(true);

		    sqlSession.insert("friendParticipant", friendListDTO);

		    sqlSession.close();

		}
	   
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
		   System.out.println("dao check parti 작동확인");
		   return check;
		   
	   }
	   
	// 채팅방 삭제
	      public int deleteParti(Chat_PartiDTO Chatdto) {
	         SqlSession sqlSession = sqlSessionFactory.openSession(true);

	         try {
	            // 1. 채팅방에서 해당 사용자 삭제
	            int deletedRows = sqlSession.delete("deleteParti", Chatdto);


	            // 2. 채팅방 내의 채팅 메시지 삭제 또는 처리 (선택적)
	            // 예를 들어, 채팅방 내의 모든 메시지를 삭제하는 작업을 추가할 수 있습니다.
	            // 이 작업은 필요에 따라 구현하세요.


	            return deletedRows; // 삭제된 행의 수 반환
	         } finally {
	            sqlSession.close();
	         }
	      }
	
	

}
