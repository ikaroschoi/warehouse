package com.ikaros.warehouse.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.sun.istack.NotNull;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Inventory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String location;
    private int quantity;
    @NotNull
    private String productCode;

    public Inventory(){

    }

    public Inventory(String location,int quantity, String productCode){
        this.location = location;
        this.quantity = quantity;
        this.productCode = productCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    @Override
    public String toString() {
        return "Inventory{" +
                "inventoryId=" + id +
                ", location='" + location + '\'' +
                ", quantity=" + quantity +
                ", productCode='" + productCode + '\'' +
                '}';
    }
}
