package playwithme.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import playwithme.db.SqlSessionManager;

public class MemberDAO {
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	ArrayList<MemberDTO> MemberList = new ArrayList<>();
	public ArrayList<MemberDTO> getmember(String memberId) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		MemberList = (ArrayList)sqlSession.selectList("get",memberId);
		sqlSession.close();
		return MemberList;
	}
	public MemberDTO login(MemberDTO member) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		MemberDTO member1 = sqlSession.selectOne("all",member);
		sqlSession.close();
		return member1;
	}
	public int upImg(MemberDTO member) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int member1 = sqlSession.update("img", member);
		sqlSession.close();
		return member1;
		
	}
}
