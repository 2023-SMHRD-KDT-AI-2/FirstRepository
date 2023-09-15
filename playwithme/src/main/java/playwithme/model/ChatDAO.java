package playwithme.model;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import playwithme.db.SqlSessionManager;

public class ChatDAO {
   SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();


   //채팅 메시지 저장
   public void saveMessage(ChatDTO chatMessage) {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      
      // 2. 데이터수집
      //ChatDTO Chatdto = new ChatDTO();
      sqlSession.insert("saveMessage",chatMessage);
      sqlSession.close();
   }

}
