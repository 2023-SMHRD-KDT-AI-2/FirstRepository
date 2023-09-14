package playwithme.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;



import playwithme.db.SqlSessionManager;
public class FavoriteDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
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
}
