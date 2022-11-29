package com.mirror.domain;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mirror.database.SqlSessionManager;


public class replyDAO {
	public int insertReply(replyVO reply) {
		int cnt =0;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		cnt=sqlSession.insert("insertReply", reply);
		if(cnt >0) {
			System.out.println("댓글 달기 성공");
			sqlSession.commit();
		}
		else {
			System.out.println("댓글 달기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		
		
		return cnt;
	}
	
	public List<replyVO> selectReply(replyVO selectReply){
		List<replyVO> replies = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		replies = sqlSession.selectList("selectReply", selectReply);
		
		if(replies !=null) {
			System.out.println("전체 댓글 불러오기 성공");
			sqlSession.commit();
			for(int i = 0; i < replies.size(); i++) {
				
			}
		}
		else {
			System.out.println("전체 댓글 불러오기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		return replies;
	}
	
	
	
	public List<replyVO> selectReplyByOne(replyVO selectReply){
		List<replyVO> replies = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		replies = sqlSession.selectList("selectReplyByOne", selectReply);
		
		if(replies !=null) {
			System.out.println("사용자 댓글 불러오기 성공");
			sqlSession.commit();
			
		}
		else {
			System.out.println("사용자  댓글 불러오기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		return replies;
	}
	
	
	public replyVO selectReplyByr_no(replyVO selectReply) {
		
		replyVO selectedReply = null;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		selectedReply = sqlSession.selectOne("selectReplyByr_no", selectReply);
		
		if(selectedReply !=null) {
			System.out.println("수정할 댓글 불러오기 성공");
			sqlSession.commit();
			
		}
		else {
			System.out.println("수정할 댓글 불러오기 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return selectedReply;
	}
	
	
	public int updateReply(replyVO reply) {
		int cnt = 0;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();

		cnt = sqlSession.update("updateReply", reply);
		if (cnt > 0) {
			System.out.println("댓글 업데이트 성공");
			sqlSession.commit();

		} else {
			System.out.println("댓글 업데이트 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		return cnt;
	}
	
	
	
	
	public int deleteReply(replyVO deleteReply) {
		int cnt = 0;
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();

		cnt = sqlSession.delete("deleteReply", deleteReply);
		if (cnt > 0) {
			System.out.println("댓글 삭제 성공");
			sqlSession.commit();

		} else {
			System.out.println("댓글 삭제 실패");
			sqlSession.rollback();
		}
		sqlSession.close();
		return cnt;
	}
	
	
	
	
	
	
}
