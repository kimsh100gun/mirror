package com.mirror.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mirror.database.SqlSessionManager;

public class placeDAO {
	public List<placeVO>selectPlace(placeVO place) {
		List<placeVO> places = null;
		SqlSessionFactory sqlSessionFactory= SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
		
		places =sqlSession.selectList("selectPlace", place);
		if(places != null) {
			System.out.println("불러오기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("불러오기 실패");
			sqlSession.rollback();
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return places;
	}
	
	public placeVO selectPlaceByp_no(placeVO place) {
		placeVO resultPlace = null;
		SqlSessionFactory sqlSessionFactory= SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
		
			resultPlace =sqlSession.selectOne("selectPlaceByp_no", place);
		if(resultPlace != null) {
			System.out.println("불러오기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("불러오기 실패");
			sqlSession.rollback();
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return resultPlace;
	}
	
	public int selectTotalN(placeVO place) {
		int total = 0;
		SqlSessionFactory sqlSessionFactory= SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
		
			total =(int)sqlSession.selectOne("selectTotalN", place);
		if(total > -1) {
			System.out.println("불러오기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("불러오기 실패");
			sqlSession.rollback();
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return total;
	}
	
	
	public List<placeVO> selectResult(placeVO place) {
		List<placeVO> places = null;
		SqlSessionFactory sqlSessionFactory= SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
		
		places =sqlSession.selectList("selectResult", place);
		if(places != null) {
			System.out.println("불러오기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("불러오기 실패");
			sqlSession.rollback();
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return places;
	}
	
	
}
