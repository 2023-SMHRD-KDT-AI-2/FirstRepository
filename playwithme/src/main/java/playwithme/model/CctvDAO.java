package playwithme.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import playwithme.db.SqlSessionManager;

public class CctvDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	ArrayList<CctvDTO> cctvlist = new ArrayList<>();
	
	public ArrayList<CctvDTO> clist() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		cctvlist = (ArrayList)sqlSession.selectList("cctv");
		
		sqlSession.close();
		
		return cctvlist;
	}
	
	
}
