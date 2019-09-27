package com.dd;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;

public class Main extends Application {

    public static Scene scene;

    public Main(){

    }
    public static void main(String[] args) {
        launch(Main.class, args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader loader = new FXMLLoader(Main.class.getResource("/dd/FormIU.fxml"));
        AnchorPane root = loader.load();
        Main.scene = new Scene(root,220,160);
        scene.getStylesheets().add("/dd/formIU.css");
        primaryStage.setScene(scene);
        primaryStage.show();

    }
}
