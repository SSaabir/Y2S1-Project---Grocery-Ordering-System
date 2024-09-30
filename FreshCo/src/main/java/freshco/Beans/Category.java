package freshco.Beans;

public class Category {
	
	private int CID;
	private String category_Name;
	
	
	public Category(int cID, String category_Name) {
		
		super();
		CID = cID;
		this.category_Name = category_Name;
	}


	public int getCID() {
		return CID;
	}


	public String getCategory_Name() {
		return category_Name;
	}


	public void setCID(int cID) {
		CID = cID;
	}


	public void setCategory_Name(String category_Name) {
		this.category_Name = category_Name;
	}
	
	
	

}
