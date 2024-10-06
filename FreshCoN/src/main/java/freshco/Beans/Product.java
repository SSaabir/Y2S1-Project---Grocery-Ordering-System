package freshco.Beans;

public class Product {
	
	private int PrID;
	private String productName;
	private String descript ;
	private double  price;
	private String unit ;
	private int quantity ;
	private String imgUrl ;
	private double discount;
	private int CID ;
	private double netPrice;
	
	
	public Product(int prID, String productName, String descript, double price, String unit, int quantity, String imgUrl,
			double discount, int cID) {
		super();
		PrID = prID;
		this.productName = productName;
		this.descript = descript;
		this.price = price;
		this.unit = unit;
		this.quantity = quantity;
		this.imgUrl = imgUrl;
		this.discount = discount;
		CID = cID;
	}


	public Product(String productName2, float price2, int quantity2) {
		this.productName = productName2;
		this.price = price2;
		this.quantity = quantity2;
	}


	public Product(int prID, String productName2, int quantity2, double netPrice, int discount2) {
		PrID = prID;
		this.productName = productName2;
		this.netPrice = netPrice;
		this.quantity = quantity2;
		this.discount = discount2;
	}


	public int getPrID() {
		return PrID;
	}


	public String getProductName() {
		return productName;
	}


	public String getDescript() {
		return descript;
	}


	public double getPrice() {
		return price;
	}


	public String getUnit() {
		return unit;
	}


	public int getQuantity() {
		return quantity;
	}


	public String getImgUrl() {
		return imgUrl;
	}


	public double getDiscount() {
		return discount;
	}


	public int getCID() {
		return CID;
	}


	public void setPrID(int prID) {
		PrID = prID;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public void setDescript(String descript) {
		this.descript = descript;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public void setUnit(String unit) {
		this.unit = unit;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public void setDiscount(double discount) {
		this.discount = discount;
	}


	public void setCID(int cID) {
		CID = cID;
	}
	

}
