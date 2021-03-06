package model.database.pojo;
// Generated Apr 19, 2018 11:52:07 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Invoice generated by hbm2java
 */
public class Invoice  implements java.io.Serializable {


     private Integer invoiceId;
     private Trip trip;
     private Date invoiceDueDate;
     private float totalPrice;
     private String description;
     private Date modifiedDate;
     private String invoiceStatus;
     private Date invoiceAddedDate;
     private Customer customer;
     private Set<Invoicelineitem> invoicelineitems = new HashSet<Invoicelineitem>(0);

    public Invoice() {
    }

	
    public Invoice(Trip trip, Date invoiceDueDate, float totalPrice, Date modifiedDate, String invoiceStatus, Date invoiceAddedDate) {
        this.trip = trip;
        this.invoiceDueDate = invoiceDueDate;
        this.totalPrice = totalPrice;
        this.modifiedDate = modifiedDate;
        this.invoiceStatus = invoiceStatus;
        this.invoiceAddedDate = invoiceAddedDate;
    }
    public Invoice(Trip trip, Date invoiceDueDate, float totalPrice, String description, Date modifiedDate, String invoiceStatus, Customer customer, Set<Invoicelineitem> invoicelineitems) {
       this.trip = trip;
       this.invoiceDueDate = invoiceDueDate;
       this.totalPrice = totalPrice;
       this.description = description;
       this.modifiedDate = modifiedDate;
       this.invoiceStatus = invoiceStatus;
       this.customer = customer;
       this.invoicelineitems = invoicelineitems;
    }
   
    public Integer getInvoiceId() {
        return this.invoiceId;
    }
    
    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }
    public Trip getTrip() {
        return this.trip;
    }
    
    public void setTrip(Trip trip) {
        this.trip = trip;
    }
    public Date getInvoiceDueDate() {
        return this.invoiceDueDate;
    }
    
    public void setInvoiceDueDate(Date invoiceDueDate) {
        this.invoiceDueDate = invoiceDueDate;
    }
    public float getTotalPrice() {
        return this.totalPrice;
    }
    
    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Date getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    public String getInvoiceStatus() {
        return this.invoiceStatus;
    }
    
    public void setInvoiceStatus(String invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }
    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    public Set<Invoicelineitem> getInvoicelineitems() {
        return this.invoicelineitems;
    }
    
    public void setInvoicelineitems(Set<Invoicelineitem> invoicelineitems) {
        this.invoicelineitems = invoicelineitems;
    }

    public Date getInvoiceAddedDate() {
        return invoiceAddedDate;
    }

    public void setInvoiceAddedDate(Date invoiceAddedDate) {
        this.invoiceAddedDate = invoiceAddedDate;
    }

    


}


