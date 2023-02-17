package com.duboomom.insutaguram.post.model;

import com.duboomom.insutaguram.user.model.User;

public class Feed {

	// 이렇게하면 굳이 안써도되는 user 정보가 너무 많이 쌓이므로...필요한 변수만 만드는게 더 좋음!
	
	private Post post;
	private User user;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
