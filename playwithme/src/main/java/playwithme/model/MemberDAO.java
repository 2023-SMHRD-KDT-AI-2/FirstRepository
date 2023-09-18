
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
		MemberDTO member1 = sqlSession.selectOne("login",member);
		sqlSession.close();
		return member1;
	}
	public MemberDTO kakaoLogin(MemberDTO member) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		MemberDTO member1 = sqlSession.selectOne("kakaoLogin",member);
		sqlSession.close();
		return member1;
	}
	public int upImg(MemberDTO member) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int member1 = sqlSession.update("img", member);
		sqlSession.close();
		return member1;
		
	}
	public int changePw(MemberDTO member) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int member1 = sqlSession.update("pw", member);
		sqlSession.close();
		return member1;
		
	}
	// 중복체크
	   
    public boolean isDuplicateId(String memberId) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        int count = sqlSession.selectOne("checkDuplicateId", memberId);
        sqlSession.close();
        return count > 0;
    }
   //회원가입 
   public int Join(MemberDTO member) {
      MemberDAO memberDAO = new MemberDAO();

       // 중복된 아이디인 경우 회원가입을 처리하지 않음
       if (memberDAO.isDuplicateId(member.getMember_Id())) {
           return 0;
       }
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      int cnt = sqlSession.insert("join", member);
      sqlSession.close();
      return cnt;
   }
}

