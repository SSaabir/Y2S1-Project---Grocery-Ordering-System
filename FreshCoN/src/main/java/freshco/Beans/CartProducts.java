package freshco.Beans;

public class CartProducts {
	private String productName; // Name of the product
    private int quantity; // Quantity of the product
    private double netPrice; // Price of the product
    private String pid; // Product ID
    private String cusid; // Customer ID
    private String oid; // Order ID

    public CartProducts(String productName, int quantity, double netPrice, String pid, String cusid, String oid) {
        this.productName = productName;
        this.quantity = quantity;
        this.netPrice = netPrice;
        this.pid = pid;
        this.cusid = cusid;
        this.oid = oid;
    }

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getNetPrice() {
		return netPrice;
	}

	public void setNetPrice(double netPrice) {
		this.netPrice = netPrice;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getCusid() {
		return cusid;
	}

	public void setCusid(String cusid) {
		this.cusid = cusid;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

}
