package ru.vlsu.ispi.config;

import org.postgresql.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Configuration {

    public Connection getConnection(String url, String password, String user) throws SQLException, ClassNotFoundException {
        DriverManager.registerDriver(new Driver());
        return DriverManager.getConnection(url, user, password);
    }
}
