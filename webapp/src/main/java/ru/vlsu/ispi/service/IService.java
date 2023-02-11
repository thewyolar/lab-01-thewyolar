package ru.vlsu.ispi.service;

import java.util.List;

public interface IService<Entity, Key> {
    List<Entity> getAll();
    boolean create(Entity model);
    Entity read(Key key);
    boolean update(Entity model);
    boolean delete(Key key);
    boolean deleteAll();
}
