package ru.vlsu.ispi.model;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

import java.util.Objects;


public class Role {
    private long id;
    @NotEmpty(message = "Название роли не может быть пустым!")
    @Size(min = 4, max = 15, message = "Название роли должно быть не меньше {min} и не больше {max} символов!")
    private String name;

    public Role() {}

    public Role(long id, String name) {
        this.id = id;
        this.name = name;
    }

    public long getId() { return id; }

    public void setId(long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id + ", name='"
                + name + '\'' + '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Role role = (Role) o;
        return id == role.id && this.name.equals(role.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }


}
