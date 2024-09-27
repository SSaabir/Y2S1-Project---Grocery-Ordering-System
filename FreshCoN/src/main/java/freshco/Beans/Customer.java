package freshco.Beans;

public class Customer {
	
	    private int cusID;
	    private String fName;
	    private String lName;
	    private String email;
	    private String lane;
	    private String city;
	    private String dob; 
	    private String imgUrl;
	    private String username;
	    private String password;
	    
	    
		public Customer(int cusID, String fName, String lName, String email, String lane, String city, String dob, String imgUrl, String username, String password) 
		{
			super();
			this.cusID = cusID;
			this.fName = fName;
			this.lName = lName;
			this.email = email;
			this.lane = lane;
			this.city = city;
			this.dob = dob;
			this.imgUrl = imgUrl;
			this.username = username;
			this.password = password;
		}


		public int getCusID() {
			return cusID;
		}


		public String getfName() {
			return fName;
		}


		public String getlName() {
			return lName;
		}


		public String getEmail() {
			return email;
		}


		public String getLane() {
			return lane;
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


		public String getUsername() {
			return username;
		}


		public String getPassword() {
			return password;
		}


		public void setCusID(int cusID) {
			this.cusID = cusID;
		}


		public void setfName(String fName) {
			this.fName = fName;
		}


		public void setlName(String lName) {
			this.lName = lName;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public void setLane(String lane) {
			this.lane = lane;
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


		public void setUsername(String username) {
			this.username = username;
		}


		public void setPassword(String password) {
			this.password = password;
		}
	    
	    
	    
}
