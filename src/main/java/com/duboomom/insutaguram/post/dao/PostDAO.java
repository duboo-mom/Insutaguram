package com.duboomom.insutaguram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.duboomom.insutaguram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("location") String location
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList();

	public Post selectPost();
	
}
