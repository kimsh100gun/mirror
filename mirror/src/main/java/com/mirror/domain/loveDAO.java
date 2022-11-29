package com.mirror.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mirror.database.SqlSessionManager;

public class loveDAO {
	//찜한 것이 있는지 없는 지 확인
	public loveVO selectLove(loveVO love) {
		loveVO selectLove = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		selectLove =sqlSession.selectOne("selectLove", love);
		if(selectLove != null) {
			System.out.println("이미 찜을 하셨습니다.");
			sqlSession.commit();
		}
		else {
			System.out.println("찜을 해도 되는 상태입니다.");
			sqlSession.commit();
		}
		sqlSession.close();
		return selectLove;
	}
	
	//찜추가
	public int insertLove(loveVO love) {
		int cnt =0;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		cnt = sqlSession.insert("insertLove", love);
		if(cnt >0) {
			System.out.println("찜 완료");
			sqlSession.commit();
		}
		else {
			System.out.println("찜 실패");
			sqlSession.rollback();
		}
		return cnt;
	}
	
	
	
	public List<placeLoveVO> selectPlaceLove(memberVO member){
		List<placeLoveVO> placeLove = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		placeLove=sqlSession.selectList("selectPlaceLove", member);
		if(placeLove != null) {
			System.out.println("사용자 찜한 곳 정보 불러오기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("사용자 찜한 곳 정보 불러오기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		return placeLove;
		
	}
	public int deleteLove(loveVO deleteLove) {
		int cnt =0;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		cnt=sqlSession.delete("deleteLove", deleteLove);
		if(cnt >0 ) {
			System.out.println("찜 지우기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("찜 지우기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		return cnt;
		
	}
	public String totalLove(String p_no) {
		String totalLove = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		totalLove=sqlSession.selectOne("totalLove", p_no);
		if(totalLove != null ) {
			System.out.println("전체 좋아요 개수 불러오기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("전체 좋아요 개수 불러오기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return totalLove;
	}
	
	public int regionTotalLove(int p_region) {
		
		int regionLove = 0;
		String test =null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		test=sqlSession.selectOne("regionTotalLove", p_region);
		if(test == null) {
			regionLove =0;
		}
		else {
			regionLove=Integer.parseInt(test);
		}
		sqlSession.commit();
		sqlSession.close();
		
		return regionLove;
		
	}
	
	
	
	
	
	
}
