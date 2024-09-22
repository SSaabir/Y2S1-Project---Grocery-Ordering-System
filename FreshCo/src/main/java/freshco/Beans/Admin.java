package freshco.Beans;

public class Admin {
	
	private int AID ;
    private String  fName ;
    private String email ;
    private String address ;
    private String city ;
    private String dob ;
    private String imgUrl ;
    private String phone ;
    private String username ;
    private String password ;
    
    
	public Admin(int aID, String fName, String email, String address, String city, String dob, String imgUrl,
			String phone, String username, String password) {
		super();
		AID = aID;
		this.fName = fName;
		this.email = email;
		this.address = address;
		this.city = city;
		this.dob = dob;
		this.imgUrl = imgUrl;
		this.phone = phone;
		this.username = username;
		this.password = password;
	}


	public int getAID() {
		return AID;
	}


	public String getfName() {
		return fName;
	}


	public String getEmail() {
		return email;
	}


	public String getAddress() {
		return address;
	}


	public String getCity() {
		return city;
	}


	public String getDob() {
		return dob;
	}


	public String getImgUrl() {
		return imgUrl;
	}


	public String getPhone() {
		return phone;
	}


	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}


	public void setAID(int aID) {
		AID = aID;
	}


	public void setfName(String fName) {
		this.fName = fName;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public void setPassword(String password) {
		this.password = password;
	}
    
    

}
