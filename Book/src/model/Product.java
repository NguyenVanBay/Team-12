package model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Product {

	private Long id;
	private String name;
	private String author;
	private Timestamp publicAt;
	private Long count;
	private Double price;
	private Category category;
	private Image thumbnail;
	ArrayList<Image> listImage;
	private String title;
	private String description;
	private String type;
	private Long createBy;
	private String url;
	
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Product() {
	}

	public Product(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Timestamp getPublicAt() {
		return publicAt;
	}

	public void setPublicAt(Timestamp publicAt) {
		this.publicAt = publicAt;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public ArrayList<Image> getListImage() {
		return listImage;
	}

	public void setListImage(ArrayList<Image> listImage) {
		this.listImage = listImage;
	}

	public Image getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(Image thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "name : " + name + " - author : " + author + " - count : " + count + " - price : " + price;
	}
}
