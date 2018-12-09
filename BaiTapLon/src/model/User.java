package model;

public class User {

	private Long pk_user_id;
	private String c_email;
	private String c_password;
	private String c_fullname;
	public Long getPk_user_id() {
		return pk_user_id;
	}
	public void setPk_user_id(Long pk_user_id) {
		this.pk_user_id = pk_user_id;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_password() {
		return c_password;
	}
	public void setC_password(String c_password) {
		this.c_password = c_password;
	}
	public String getC_fullname() {
		return c_fullname;
	}
	public void setC_fullname(String c_fullname) {
		this.c_fullname = c_fullname;
	}
}
