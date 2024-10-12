package freshco.Beans;

public class Feedback {
	
	private int FID ;
    private String comments ;
    private String rating;
    private int OID ;
    
    
	public Feedback(int fID, String comments, String rating, int oID) {
		super();
		FID = fID;
		this.comments = comments;
		this.rating = rating;
		OID = oID;
	}


	public int getFID() {
		return FID;
	}


	public String getComments() {
		return comments;
	}


	public String getRating() {
		return rating;
	}


	public int getOID() {
		return OID;
	}


	public void setFID(int fID) {
		FID = fID;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public void setOID(int oID) {
		OID = oID;
	}
    

}
