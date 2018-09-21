package ru.davidlevi.common;

import ru.davidlevi.common.dao.AuthentificationService;
import ru.davidlevi.common.dao.SQLiteService;

import java.net.ServerSocket;
import java.net.Socket;

public class Server {
    private AuthentificationService authentificationService;

    public Server( ) {
        daemon();
    }

    private void daemon() {
        Thread daemon = new Thread(() -> {
            try (ServerSocket server = new ServerSocket(5626)) {
                this.authentificationService = new SQLiteService();   // = new BaseAuthService();
                this.authentificationService.start();
                while (true) {
                    Socket socket = server.accept();
                    //new ClientHandler(this, socket, this.controller);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                this.authentificationService.stop();
            }
        });
        daemon.setDaemon(true);
        daemon.start();
    }
}
