package freshco.Beans;

public class Enquiry {

	private int enID;
    private String subject;
    private String comments;
    private String response;
    
    
	public Enquiry(int enID, String subject, String comments, String response) 
	{
		super();
		this.enID = enID;
		this.subject = subject;
		this.comments = comments;
		this.response = response;
	}


	public int getEnID() {
		return enID;
	}


	public String getSubject() {
		return subject;
	}


	public String getComments() {
		return comments;
	}


	public String getResponse() {
		return response;
	}


	public void setEnID(int enID) {
		this.enID = enID;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public void setResponse(String response) {
		this.response = response;
	}
	
    
    
	
}
