package com.example.curd.model;

import javax.persistence.*;

@Entity
@Table( name="productTable")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private  String name;
    private  String brand;
    private  String madein;
    private  float price
            ;

    public Product() {
    }

    public Product(String name, String brand, String madein, float price
    ) {
        this.name = name;
        this.brand = brand;
        this.madein = madein;
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getMadein() {
        return madein;
    }

    public void setMadein(String madein) {
        this.madein = madein;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price
    ) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", madein='" + madein + '\'' +
                ", price=" + price +
                '}';
    }
}


