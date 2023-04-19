package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;

public class GogekDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static GogekDAO single = null;

	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory	= null;
	
	public GogekDAO() {
		//DAO클래스가 생성자를 통해 메모리 할당을 받을때
		//factory(어떤 DB로 접속할 것인지, mapper로 누구를 쓸것인가...)를 가져온다
		factory = MyBatisConnector.getInstance().getSessionFactory();
	}
	
	//사원목록 조회
	public List<GogekVO> selectGogek(){
		
		//맵퍼를 호출하고 쿼리문을 요청하거나, 파라미터를 보내는 등의 작업을 하는 클래스
		SqlSession sqlSession = factory.openSession();
		
		//selectList메서드를 통해 mapper가 호출되면
		//실행된 query문의 최종결과를 List구조로 받는다
		List<GogekVO> list =  sqlSession.selectList("g.gogek_list");
		
		return list;
	}
	
	//선택적 고객목록 가져오기
	public List<GogekVO> selectGogek(String addr){
		
		//맵퍼를 호출하고 쿼리문을 요청하거나, 파라미터를 보내는 등의 작업을 하는 클래스
		SqlSession sqlSession = factory.openSession();
		
		//selectList메서드를 통해 mapper가 호출되면
		//실행된 query문의 최종결과를 List구조로 받는다
		List<GogekVO> list =  sqlSession.selectList("g.gogek_select", addr);
		
		return list;
	}
	
	//고객삭제
	public int delete(int idx) {
		SqlSession sqlSession = factory.openSession(true);//auto commit
		
		//sqlSession은 모든 메서드가 파라미터를 반드시 한개만 가질 수 있다.
		int res = sqlSession.delete("g.gogek_del",idx);
		
		sqlSession.close();
		
		return res;
	}
	
	//고객추가
	
	public int insert(GogekVO vo) {
		SqlSession sqlSession = factory.openSession(true); //auto commit
		
		//맵퍼로 전달할 파라미터는 최대 1개까지.
	int	res = sqlSession.insert("g.gogek_ins",vo);
	sqlSession.close();
	
	return res;
	}
	
	
}
