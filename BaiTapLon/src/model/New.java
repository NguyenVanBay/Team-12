package model;

import java.sql.Timestamp;

public class New {

	private Long pk_news_id;
	private Long fk_category_news_id;
	private String c_name;
	private String c_description;
	private String c_content;
	private String c_img;
	private Timestamp c_time;
	
	public Timestamp getC_time() {
		return c_time;
	}
	public void setC_time(Timestamp c_time) {
		this.c_time = c_time;
	}
	public Long getC_hotnews() {
		return c_hotnews;
	}
	public void setC_hotnews(Long c_hotnews) {
		this.c_hotnews = c_hotnews;
	}
	public Long getC_latestnews() {
		return c_latestnews;
	}
	public void setC_latestnews(Long c_latestnews) {
		this.c_latestnews = c_latestnews;
	}
	private Long c_hotnews;
	private Long c_latestnews;
	public Long getPk_news_id() {
		return pk_news_id;
	}
	public void setPk_news_id(Long pk_news_id) {
		this.pk_news_id = pk_news_id;
	}
	public Long getFk_category_news_id() {
		return fk_category_news_id;
	}
	public void setFk_category_news_id(Long fk_category_news_id) {
		this.fk_category_news_id = fk_category_news_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_description() {
		return c_description;
	}
	public void setC_description(String c_description) {
		this.c_description = c_description;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_img() {
		return c_img;
	}
	public void setC_img(String c_img) {
		this.c_img = c_img;
	}
}
