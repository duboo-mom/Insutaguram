package com.duboomom.insutaguram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.insutaguram.common.FileManagerService;
import com.duboomom.insutaguram.post.comment.bo.CommentBO;
import com.duboomom.insutaguram.post.comment.model.CommentDetail;
import com.duboomom.insutaguram.post.dao.PostDAO;
import com.duboomom.insutaguram.post.like.bo.LikeBO;
import com.duboomom.insutaguram.post.model.Post;
import com.duboomom.insutaguram.post.model.PostDetail;
import com.duboomom.insutaguram.user.bo.UserBO;
import com.duboomom.insutaguram.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	public int addPost(int userId, String content, String location, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, location, imagePath);
		
	}
	
	public List<PostDetail> getPostList(int userId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		// 생성된 postDetail 객체를 리스트로 구성한다.		
		List<PostDetail> postDetailList = new ArrayList<>();
				
		for(Post post:postList) {
			// postDetail 객체를 생성하고, post 객체의 정보를 저장한다.
			// userName 값을 저장한다.
			PostDetail postDetail = new PostDetail();
			User user = userBO.getUserById(post.getUserId());
			
			// 좋아요 갯수 조회
			int likeCount = likeBO.countLikeByPostId(post.getId());			
			// 좋아요 여부 조회
			boolean isLike = likeBO.isLike(post.getId(), userId);
			// 해당 post에 달린 댓글 조회
			List<CommentDetail> commentList = commentBO.getCommentByPostId(post.getId());
			
			postDetail.setId(post.getId());
			postDetail.setUserId(post.getUserId());
			postDetail.setLocation(post.getLocation());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());						
			postDetail.setUserName(user.getLoginId());
			postDetail.setLike(isLike);
			postDetail.setLikeCount(likeCount);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
		
	}
	
	public PostDetail getPostDetailById(int postId) {
		
		Post post = postDAO.selectPostbyId(postId);
		
		PostDetail postDetail = new PostDetail();
		User user = userBO.getUserById(post.getUserId());
				
		// 해당 post에 달린 댓글 조회
		List<CommentDetail> commentList = commentBO.getCommentByPostId(post.getId());
		
		postDetail.setId(post.getId());
		postDetail.setUserId(post.getUserId());
		postDetail.setLocation(post.getLocation());
		postDetail.setContent(post.getContent());
		postDetail.setImagePath(post.getImagePath());						
		postDetail.setUserName(user.getLoginId());

		postDetail.setCommentList(commentList);
		
		return postDetail;
		
	}
	
	public int deletePost(int postId, int userId) {
		
		Post post = postDAO.selectPostbyId(postId);

		// 로그인한 userId와 postId 에 해당하는 게시글 삭제
		int count = postDAO.deletePost(postId, userId);
		
		if(count == 1) {
			
			// imagePath에 있는 파일도 지우기
			FileManagerService.removeFile(post.getImagePath());
			
			// 근데 해당하는 post에 댓글과 좋아요가 없을수도 있음
			// comment랑 like는 delete 쿼리 수행후 count 0이어도 상관 없음...?
			// => 없을수도 있고, 많을수도 있어서 count 수가 중요한건 아님!
			commentBO.deleteCommentByPostId(postId);
			likeBO.deleteLikeByPostId(postId);		
			
		}
		
		return count;
				
	}
	
	public List<PostDetail> getMyPostList(int userId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			// post의 userId가 입력받은 userId와 일치한 값만 가져오기
			if(post.getUserId() == userId) {
				// postDetail 객체를 생성하고, post 객체의 정보를 저장한다.
				// userName 값을 저장한다.
				PostDetail postDetail = new PostDetail();
				User user = userBO.getUserById(post.getUserId());
				
				// 좋아요 갯수 조회
				int likeCount = likeBO.countLikeByPostId(post.getId());			
				// 좋아요 여부 조회
				boolean isLike = likeBO.isLike(post.getId(), userId);
				// 해당 post에 달린 댓글 조회
				List<CommentDetail> commentList = commentBO.getCommentByPostId(post.getId());
				
				postDetail.setId(post.getId());
				postDetail.setUserId(post.getUserId());
				postDetail.setLocation(post.getLocation());
				postDetail.setContent(post.getContent());
				postDetail.setImagePath(post.getImagePath());						
				postDetail.setUserName(user.getLoginId());
				postDetail.setLike(isLike);
				postDetail.setLikeCount(likeCount);
				postDetail.setCommentList(commentList);
				
				postDetailList.add(postDetail);				
				
			}
						
		}
		
		return postDetailList;
		
		
	}
	
	
	
//	public List<Feed> getPostList() {
//		
//		Feed feed = new Feed();
//		
//		Post post = postDAO.selectPost();
//		int userId = post.getUserId();
//		
//		User user = userDAO.selectUserById(userId);
//		
//		feed.setPost(post);
//		feed.setUser(user);
//		
//		List<Feed> postList = new ArrayList<>();
//		
//		postList.add(feed);
//		
//		
//	}
	
}
