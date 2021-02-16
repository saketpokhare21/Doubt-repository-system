package com.doubtRepository.model;

public class CommentModel {
	String comment;
	int prn_no;
	int post_id;
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getPrn_no() {
		return prn_no;
	}
	public void setPrn_no(int prn_no) {
		this.prn_no = prn_no;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	@Override
	public String toString() {
		return "CommentModel [comment=" + comment + ", prn_no=" + prn_no + ", post_id=" + post_id + "]";
	}
	
	
}
