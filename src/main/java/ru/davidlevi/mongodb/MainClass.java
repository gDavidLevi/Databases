package ru.davidlevi.mongodb;

import ru.davidlevi.mongodb.dao.MongoConnector;
import ru.davidlevi.mongodb.model.User;

import java.util.Properties;

/**
 * Install https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
 * MongoDB Tutorial https://www.tutorialspoint.com/mongodb/mongodb_java.htm
 * Guide to MongoDB with Java https://www.baeldung.com/java-mongodb
 *
 * Пример работает на версии MongoDB 3.6.3 из репозитория Ubuntu 18.04 LTS
 */
public class MainClass {
    public static void main(String[] args) {
        Properties socket = new Properties();
        socket.setProperty("host", "localhost"); // server (ru.davidlevi.mongodb://localhost:27017)
        socket.setProperty("port", "27017"); // port

        Properties databaseAndTable = new Properties();
        databaseAndTable.setProperty("database", "admin"); // database name
        databaseAndTable.setProperty("table", "users"); // table or collection

        MongoConnector mongo = new MongoConnector(socket, databaseAndTable);
        System.out.println("Connected to server? : " + mongo.isConnected());

        User user;

        // INSERT
        mongo.insert(new User("David"));

        // SELECT
        user = mongo.select("David");
        System.out.println(user); // User{id='5b8ec16222e9fe12eb96d3df', login='David'}

        // UPDATE
        mongo.update("David", "Iakov");

        user = mongo.select("Iakov");
        System.out.println(user); // User{id='5b8ec1aa22e9fe133dea633c', login='Iakov'}

        // DELETE
//        mongo.delete("Iakov");

        mongo.close();
    }
}
