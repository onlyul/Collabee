package com.one.dto;

public class MyCommentsDto {
	private String content;
	private String workspace_name;
	private String title;
	private String creation_date;
	private int document_id;
	
	public MyCommentsDto() {}
	public MyCommentsDto(int document_id, String content, String workspace_name, String title, String creation_date) {
		super();
		this.document_id = document_id;
		this.content = content;
		this.workspace_name = workspace_name;
		this.title = title;
		this.creation_date = creation_date;
	}
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
}
