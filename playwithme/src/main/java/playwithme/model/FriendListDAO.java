/*
 * 2023.09.17
 * 박기원
 * 목적 친구 리스트 불러오기 및 친구 추가, 친구 삭제
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
	
	ArrayList<FriendListDTO> allfriendlist = new ArrayList<>();
	// 친구 전체 보기
	public ArrayList<FriendListDTO> friendlist() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		allfriendlist = (ArrayList)sqlSession.selectList("friendlist");
		
		sqlSession.close();
		
		return allfriendlist;
	}
	
	
//친구 추가
	public int friendAdd(FriendListDTO frienddto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("friendAdd", frienddto);
		sqlSession.close();
		
		return cnt;   
	 }
	
	//친구 삭제
	public int deleteFriend(FriendListDTO friendDTO) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);

	    try {
	        // 친구 목록에서 해당 친구 삭제
	        int deletedRows = sqlSession.delete("deleteFriend", friendDTO);

	        return deletedRows; // 삭제된 행의 수 반환
	    } finally {
	        sqlSession.close();
	    }
	}






}
