package com.duboomom.insutaguram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.insutaguram.common.FileManagerService;
import com.duboomom.insutaguram.post.dao.PostDAO;
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
	
	public int addPost(int userId, String content, String location, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, location, imagePath);
		
	}
	
	public List<PostDetail> getPostList() {
		
		List<Post> postList = postDAO.selectPostList();
		
		// 생성된 postDetail 객체를 리스트로 구성한다.		
		List<PostDetail> postDetailList = new ArrayList<>();
				
		for(Post post:postList) {
			// postDetail 객체를 생성하고, post 객체의 정보를 저장한다.
			// userName 값을 저장한다.
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setId(post.getId());
			postDetail.setUserId(post.getUserId());
			postDetail.setLocation(post.getLocation());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
						
			User user = userBO.getUserById(post.getUserId());
			postDetail.setUserName(user.getLoginId());
			
			postDetailList.add(postDetail);
			
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
