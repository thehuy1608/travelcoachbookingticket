package model.database.pojo;
// Generated Apr 19, 2018 11:52:07 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Customer generated by hbm2java
 */
public class Customer  implements java.io.Serializable {


     private int invoiceId;
     private Invoice invoice;
     private String customerName;
     private String customerPhoneNumber;
     private String customerEmail;
     private Date customerDateOfBirth;
     private String customerAddress;
     private Date modifiedDate;

    public Customer() {
    }

	
    public Customer(Invoice invoice, String customerName, String customerPhoneNumber, Date modifiedDate) {
        this.invoice = invoice;
        this.customerName = customerName;
        this.customerPhoneNumber = customerPhoneNumber;
        this.modifiedDate = modifiedDate;
    }
    public Customer(Invoice invoice, String customerName, String customerPhoneNumber, String customerEmail, Date customerDateOfBirth, String customerAddress, Date modifiedDate) {
       this.invoice = invoice;
       this.customerName = customerName;
       this.customerPhoneNumber = customerPhoneNumber;
       this.customerEmail = customerEmail;
       this.customerDateOfBirth = customerDateOfBirth;
       this.customerAddress = customerAddress;
       this.modifiedDate = modifiedDate;
    }
   
    public int getInvoiceId() {
        return this.invoiceId;
    }
    
    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }
    public Invoice getInvoice() {
        return this.invoice;
    }
    
    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }
    public String getCustomerName() {
        return this.customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    public String getCustomerPhoneNumber() {
        return this.customerPhoneNumber;
    }
    
    public void setCustomerPhoneNumber(String customerPhoneNumber) {
        this.customerPhoneNumber = customerPhoneNumber;
    }
    public String getCustomerEmail() {
        return this.customerEmail;
    }
    
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }
    public Date getCustomerDateOfBirth() {
        return this.customerDateOfBirth;
    }
    
    public void setCustomerDateOfBirth(Date customerDateOfBirth) {
        this.customerDateOfBirth = customerDateOfBirth;
    }
    public String getCustomerAddress() {
        return this.customerAddress;
    }
    
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    public Date getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }




}

