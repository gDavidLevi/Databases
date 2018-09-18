package ru.davidlevi.mongodb;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import ru.davidlevi.mongodb.model.User;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.Properties;

/**
 * MongoConnecter
 */
public class MongoConnecter {
    private MongoClient connection;
    private MongoCollection<Document> table;  // table or Collection
    private boolean isConnected = true;

    /**
     * Конструктор
     *
     * @param socket Properties
     */
    public MongoConnecter(Properties socket, Properties databaseAndTable) {
        try {
            connection = new MongoClient(socket.getProperty("host"), Integer.valueOf(socket.getProperty("port")));
            MongoDatabase mongoDatabase = connection.getDatabase(databaseAndTable.getProperty("database"));
            table = mongoDatabase.getCollection(databaseAndTable.getProperty("table"));
        } catch (Exception e) {
            isConnected = true;
            e.printStackTrace();
            connection.close();
        }
    }

    /**
     * Подключен ли к серверу?
     *
     * @return boolean
     */
    public boolean isConnected() {
        return isConnected;
    }

    /**
     * INSERT
     *
     * @param user User
     */
    public void insert(User user) {
        Document document = new Document();
        document.put("login", user.getLogin());
        table.insertOne(document);
    }

    /**
     * SELECT
     *
     * @param login String
     * @return User
     */
    public User select(String login) {
        Bson filter = Filters.eq("login", login);
        FindIterable<Document> result = table.find(filter);
        User user = new User();
        user.setLogin(String.valueOf(result.first().get("login")));
        user.setId(String.valueOf(result.first().get("_id")));
        return user;
    }

    /**
     * UPDATE
     *
     * @param oldLogin старый логин пользователя
     * @param newLogin новый логин который мы хотим задать
     */
    public void update(String oldLogin, String newLogin) {
        Bson filter = Filters.eq("login", oldLogin);
        Bson update = Updates.set("login", newLogin);
        table.updateOne(filter, update);
    }

    /**
     * DELETE
     *
     * @param login String
     */
    public void delete(String login) {
        Bson filter = Filters.eq("login", login);
        //table.deleteOne(filter); // удалить один
        table.deleteMany(filter); // удалить все
    }

    /**
     * Закрытие подключения
     */
    public void close() {
        connection.close();
    }
}
