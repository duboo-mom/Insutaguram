package com.duboomom.insutaguram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.duboomom.insutaguram.common.FileManagerService;
import com.duboomom.insutaguram.post.dao.PostDAO;
import com.duboomom.insutaguram.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, String location, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, location, imagePath);
		
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
}
