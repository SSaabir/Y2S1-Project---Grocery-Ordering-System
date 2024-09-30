package freshco.Beans;

import java.sql.Date;

public class Sale {
	
	private int OID ;
    private Date orderDate ;
    private double totalAmount;
    private boolean orderStatus;
    private int CusID ;
    private int PID ;
    private int DPID ;
    
    
	public Sale(int oID, Date date, double totalAmount, boolean orderStatus, int cusID, int pID, int dPID) {
		super();
		OID = oID;
		this.orderDate = date;
		this.totalAmount = totalAmount;
		this.orderStatus = orderStatus;
		CusID = cusID;
		PID = pID;
		DPID = dPID;
	}
	
	
	public int getOID() {
		return OID;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public boolean isOrderStatus() {
		return orderStatus;
	}
	public int getCusID() {
		return CusID;
	}
	public int getPID() {
		return PID;
	}
	public int getDPID() {
		return DPID;
	}
	public void setOID(int oID) {
		OID = oID;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public void setOrderStatus(boolean orderStatus) {
		this.orderStatus = orderStatus;
	}
	public void setCusID(int cusID) {
		CusID = cusID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public void setDPID(int dPID) {
		DPID = dPID;
	}
    

}
