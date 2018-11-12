package model;

public class User {

	private Long id;
	private String name;
	private String email;
	private String password;
	private String address;
	private String phone;
	private Long role;
	private Long createBy;
	
	// danh sách chức vụ user.
	public static final Long NGUOIDUNG = (long) 0;
	public static final Long GIAMDOC = (long) 4;
	public static final Long QUANLYNHANVIEN = (long) 1;
	public static final Long QUANLYTHELOAI = (long) 2;
	public static final Long QUANLYKHO = (long) 3;

	public Long getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public Long getRole() {
		return role;
	}

	public void setRole(Long role) {
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
