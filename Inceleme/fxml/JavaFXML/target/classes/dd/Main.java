package com.dd;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

public class Main extends Application {

    public static Scene scene;

    public Main(){

    }
    public static void main(String[] args) {
        launch(Main.class, args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader loader = new FXMLLoader(Main.class.getResource("/FXML/FormIU.fxml"));
        AnchorPane root = loader.load();
        Main.scene = new Scene(root,230,190);
        scene.getStylesheets().add("/FXML/formIU.css");
        primaryStage.setScene(scene);
        primaryStage.show();

    }
}
