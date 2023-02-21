package com.duboomom.insutaguram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.insutaguram.post.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	// 특정 post id를 전달 받고, 좋아요 개수를 리턴하는 메소드
	public int countLikeByPostId(int postId) {
		return likeDAO.selectCountLikeByPostId(postId);
	}
	
	// postId와 userId를 전달 받고 좋아요 여부 리턴하는 메소드
	public boolean isLike(int postId, int userId) {
		
		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
}
