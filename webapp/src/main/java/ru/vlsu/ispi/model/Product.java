package ru.vlsu.ispi.model;

import jakarta.validation.constraints.*;

import java.util.Objects;

public class Product {
    private long id;
    @NotNull(message = "Название продукта не может быть пустым!")
    @Pattern(message = "Название продукта должно содержать только буквы!", regexp = "[A-Z,a-z]+")
    @Size(min = 4, max = 15, message = "Название продукта должно быть не меньше {min} и не больше {max} символов!")
    private String name;
    @NotNull(message = "Цена продукта не может быть пустой!")
    @DecimalMax(message = "Цена продукта должна быть не больше {value}!", value = "10000")
    @DecimalMin(message = "Цена продукта должна быть положительным числом!", value = "0")
    private double price;

    public Product() {}

    public Product(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public long getId() { return id;}

    public void setId(long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }

    public void setPrice(double price) { this.price = price; }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price + '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Product product = (Product) o;
        return id == product.id && Double.compare(product.price, price) == 0 && name.equals(product.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, price);
    }
}
