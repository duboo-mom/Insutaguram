package com.duboomom.insutaguram.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.insutaguram.post.comment.dao.CommentDAO;
import com.duboomom.insutaguram.post.comment.model.Comment;
import com.duboomom.insutaguram.post.comment.model.CommentDetail;
import com.duboomom.insutaguram.user.bo.UserBO;
import com.duboomom.insutaguram.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public List<CommentDetail> getCommentByPostId(int postId) {
		
		// 댓글 조회 결과를 기반으로 댓글 마다 작성자 정보를 조회한다.
		List<Comment> commentList = commentDAO.selectCommentListByPostId(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment:commentList) {
			CommentDetail commentDetail = new CommentDetail();
			
			User user = userBO.getUserById(comment.getUserId());
			
			commentDetail.setId(comment.getId());
			commentDetail.setPostId(comment.getPostId());
			commentDetail.setUserId(comment.getUserId());
			commentDetail.setContent(comment.getContent());
			commentDetail.setUserName(user.getLoginId());
			
			commentDetailList.add(commentDetail);
			
		}
		
		return commentDetailList;
		
	}
		
}
