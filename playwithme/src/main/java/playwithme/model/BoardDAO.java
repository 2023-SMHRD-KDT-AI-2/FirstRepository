package playwithme.model;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import playwithme.db.SqlSessionManager;

public class BoardDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
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
	
	// 내 게시물 
	public ArrayList<BoardDTO> myList(String memberId) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		boardlist = (ArrayList)sqlSession.selectList("myList",memberId);
		
		sqlSession.close();
		
		return boardlist;
	}
	
	// 지도 위 게시글 
	public ArrayList<BoardDTO> meeting() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		boardlist = (ArrayList)sqlSession.selectList("meeting");
		
		sqlSession.close();
		
		return boardlist;
	}
	
	
	
}
