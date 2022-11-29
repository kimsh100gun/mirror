package com.mirror.domain;


import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.mirror.database.SqlSessionManager;



public class memberDAO {
	public int insertMember(memberVO member) {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt =0;
		try {
			
			cnt = sqlSession.insert("insertMember", member);
			if(cnt >0) {
				System.out.println("회원가입 성공");
				sqlSession.commit();
			
			}
			else {
				System.out.println("회원가입 실패");
				sqlSession.rollback();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	
		
		
		return cnt;
		
	
}
	
	public memberVO selectMember(memberVO member) {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession =sqlSessionFactory.openSession();
		
		memberVO login_member =null;
		
		try {
			login_member = sqlSession.selectOne("selectMember", member);
			
			if(login_member !=null) {
				
				System.out.println("로그인 성공");
				sqlSession.commit();
			
				
			}
			else {
				System.out.println("로그인 실패");
				sqlSession.rollback();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return login_member;
	}
	
	
	public int deleteMember(memberVO member) {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession =sqlSessionFactory.openSession();
		
		int cnt =0;
		
		try {
			cnt=sqlSession.delete("deleteMember", member);
			if(cnt>0) {
				System.out.println("회원탈퇴 성공");
				sqlSession.commit();
				
			}
			else {
				System.out.println("회원탈퇴 실패");
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	
	
	
	public int updateMember(memberVO member) {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession =sqlSessionFactory.openSession();
		
		int cnt =0;
		
		try {
			cnt=sqlSession.delete("updateMember", member);
			if(cnt>0) {
				System.out.println("업데이트 성공");
				sqlSession.commit();
				
			}
			else {
				System.out.println("업데이트 실패");
				sqlSession.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return cnt;
	}
	
}
