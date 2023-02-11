package ru.vlsu.ispi.dao;

import java.util.List;

public interface DAO<Entity, Key> {
    List<Entity> getAll();
    boolean create(Entity model);
    Entity read(Key key);
    boolean update(Entity model);
    boolean delete(Key key);
    boolean deleteAll();
}
