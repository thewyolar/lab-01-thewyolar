package ru.vlsu.ispi.model;

import jakarta.validation.constraints.NotNull;

import java.sql.Date;
import java.util.Objects;

public class Order {
    private long id;
    private User user;
    private Product product;
    @NotNull(message = "Количество продуктов не может быть пустым!")
    private int count;
    @NotNull(message = "Дата заказа не может быть пустой!")
    private Date date;

    public Order() {}

    public Order(int id, User user, Product product, int count, Date date) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.count = count;
        this.date = date;
    }

    public long getId() { return id; }

    public void setId(long id) { this.id = id;}

    public int getCount() { return count; }

    public void setCount(int count) { this.count = count; }

    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }

    public Product getProduct() { return product; }

    public void setProduct(Product product) { this.product = product; }

    public Date getDate() { return date; }

    public void setDate(Date date) { this.date = date; }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", count=" + count +
                ", user=" + user.toString() +
                ", product=" + product.toString() +
                ", date='" + date + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Order order = (Order) o;
        return id == order.id && count == order.count && user.equals(order.user) && product.equals(order.product) && date.equals(order.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, user, product, count, date);
    }
}
