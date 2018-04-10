package com.yedam.app.notice.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.notice.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; //mybatis-context bean 등록되있음 //jdbc템플릿 대신
	
	public void insertNotice(NoticeVO vo) {
		sqlSession.insert("notice.insertNotice",vo); // noticeMapper 에 지정한 , (namespace id. 메소드 id)
	}

	public void updateNotice(NoticeVO vo){
		sqlSession.update("notice.updateNotice",vo);
	}
	
	public void updateView(NoticeVO vo) {
		sqlSession.update("notice.updateView",vo);
	}

	public void deleteNotice(NoticeVO vo){
		sqlSession.delete("notice.deleteNotice",vo);
	}

	public NoticeVO getNotice(NoticeVO vo){
		System.out.println("mybatis getnotice");
		return sqlSession.selectOne("notice.getNotice",vo);
	}

	
	public List<NoticeVO> getNoticeList(NoticeVO vo){
		System.out.println("mybatis getnoticeList");
		return sqlSession.selectList("notice.getNoticeList",vo);
	}
	
	
	
	public int getCount(NoticeVO vo) {
		return sqlSession.selectOne("notice.getCount",vo);
	}
	
}
