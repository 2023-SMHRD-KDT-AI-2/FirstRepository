package playwithme.model;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import playwithme.db.SqlSessionManager;

public class BoardDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessoin();
	
	
	// 게시판 글쓰기 기능
	public int write(BoardDTO board) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("write",board);
		
		sqlSession.close();
		
		return cnt;
	}
	
	ArrayList<BoardDTO> boardlist = new ArrayList<>();
	// 게시물 전체 보기
	public ArrayList<BoardDTO> list() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		boardlist = (ArrayList)sqlSession.selectList("list");
		
		sqlSession.close();
		
		return boardlist;
	}
	// 내게시글 불러오기 -강련 
	public BoardDTO oneList(String num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		BoardDTO boardlist = sqlSession.selectOne("oneList",num);
		
		sqlSession.close();
		
		return boardlist;
	}
	
	public ArrayList<BoardDTO> myList(String memberId) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		boardlist = (ArrayList)sqlSession.selectList("myList",memberId);
		
		sqlSession.close();
		
		return boardlist;
	}
	// 게시글 삭제 -강련
	public int deleteOne(int num) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int message1 = sqlSession.delete("deleteOne",num);
		sqlSession.close();
		return message1;
	}
	// 게시글 수정 -강련
	public  BoardDTO fixList(String num) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		BoardDTO boardlist = sqlSession.selectOne("fixList",num);
		sqlSession.close();
		return boardlist;
	}
	
	public  int boardup(BoardDTO num) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int boardlist = sqlSession.update("boardup",num);
		sqlSession.close();
		return boardlist;
	}

	//인원수 증가하는 함수
	   public int partinumup(int boardnum) {
		      SqlSession sqlSession= sqlSessionFactory.openSession(true);
		      int cnt=sqlSession.update("partinumup", boardnum);
		      sqlSession.close();
		      return cnt;
		   }

	
}
