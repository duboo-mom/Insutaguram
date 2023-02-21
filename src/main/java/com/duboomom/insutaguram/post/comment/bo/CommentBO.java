package com.duboomom.insutaguram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.insutaguram.post.comment.dao.CommentDAO;
import com.duboomom.insutaguram.post.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public List<Comment> getCommentByPostId(int postId) {
		return commentDAO.selectCommentByPostId(postId);
	}
		
}
