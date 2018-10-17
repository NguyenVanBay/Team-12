package model;

import java.util.ArrayList;

public class Category {
	private Long id;
	private String name;
	private ArrayList<Product> listProduct;

	public Category() {
	}

	public Category(Long id) {
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

	public ArrayList<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(ArrayList<Product> listProduct) {
		this.listProduct = listProduct;
	}
}
