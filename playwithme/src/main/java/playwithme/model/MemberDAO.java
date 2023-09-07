package playwithme.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import playwithme.db.SqlSessionManager;

public class MemberDAO {
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public MemberDTO login(MemberDTO member) {
		SqlSession sqlSession= sqlSessionFactory.openSession();
		MemberDTO member1 = sqlSession.selectOne("all",member);
		sqlSession.close();
		return member1;
	}
}
