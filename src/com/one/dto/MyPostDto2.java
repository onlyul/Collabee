package com.one.dto;

public class MyPostDto2 {
	private String kanban_icon_p;
	private String title;
	private String workspace_name;
	private int workspace_id;
	private String date;
	private int document_id;
	
	public MyPostDto2() {}
	public MyPostDto2(String kanban_icon_p, String title, String workspace_name, int workspace_id, String date,
			int document_id) {
		super();
		this.kanban_icon_p = kanban_icon_p;
		this.title = title;
		this.workspace_name = workspace_name;
		this.workspace_id = workspace_id;
		this.date = date;
		this.document_id = document_id;
	}

	public String getKanban_icon_p() {
		return kanban_icon_p;
	}
	public void setKanban_icon_p(String kanban_icon_p) {
		this.kanban_icon_p = kanban_icon_p;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
}
