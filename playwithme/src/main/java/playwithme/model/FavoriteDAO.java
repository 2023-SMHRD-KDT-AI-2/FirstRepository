package playwithme.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;



import playwithme.db.SqlSessionManager;
public class FavoriteDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessoin();
	
	public int interestup(FavoriteDTO fav) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int member1 = sqlSession.insert("in",fav);
		sqlSession.close();
		return member1;
	}
	public FavoriteDTO incheck(FavoriteDTO fav) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		FavoriteDTO member1 = sqlSession.selectOne("incheck",fav);
		sqlSession.close();
		return member1;
	}
	public int inup(FavoriteDTO fav) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int member1 = sqlSession.insert("inup",fav);
		sqlSession.close();
		return member1;
	}
	public int delfav(FavoriteDTO fav) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int member1 = sqlSession.insert("favdel",fav);
		sqlSession.close();
		return member1;
	}
	public int findnum(String id) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		int num = sqlSession.selectOne("findnum", id);
		sqlSession.close();
		return num;
		
	}
	ArrayList<FavoriteDTO> favList = new ArrayList<FavoriteDTO>();
	public ArrayList<FavoriteDTO> findfav(int num) {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		favList = (ArrayList)sqlSession.selectList("findfav", num);
		sqlSession.close();
		return favList;
	}
}
