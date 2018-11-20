package model;

public class Image {

	private Long id;
	private String name;
	private Product product;
	private Long type;
	
	public Image() {
	}

	public Image(String name) {
		super();
		this.name = name;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getName();
	}
}
