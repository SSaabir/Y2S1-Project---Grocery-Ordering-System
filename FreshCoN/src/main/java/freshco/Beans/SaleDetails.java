package freshco.Beans;

public class SaleDetails {
    private Sale sale;
    private Payment payment;
    private Feedback feedback;
    private Customer customer;

    public SaleDetails(Sale sale, Payment payment, Feedback feedback, Customer customer) {
        this.sale = sale;
        this.payment = payment;
        this.feedback = feedback;
        this.customer = customer;
    }

    // Getters and setters (if needed)

    public Sale getSale() {
        return sale;
    }

    public Payment getPayment() {
        return payment;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public Customer getCustomer() {
        return customer;
    }
}
