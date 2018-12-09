package model;

public class Category {
	
	private Long pk_category_news_id;
	private String c_name;
	public Long getPk_category_news_id() {
		return pk_category_news_id;
	}
	public void setPk_category_news_id(Long pk_category_news_id) {
		this.pk_category_news_id = pk_category_news_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
}
