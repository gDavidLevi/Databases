package ru.davidlevi.mongodb.model;

/**
 * Сущность
 */
public class User {
    private String id;
    private String login;

    public User() {
    }

    public User(String login) {
        this.login = login;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", login='" + login + '\'' +
                '}';
    }
}
