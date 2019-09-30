package com.tr;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;


public class MainClass extends Application {
    public static Scene scene;
    public static void main(String[] args) {

        launch(MainClass.class, args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {

        try {

            FXMLLoader loader = new FXMLLoader(MainClass.class.getResource("/tr/MainUI.fxml"));
            AnchorPane root = loader.load();
            MainClass.scene = new Scene(root,900,250);
            scene.getStylesheets().add("/tr/demo.css");
          //  scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
            primaryStage.setScene(scene);
            primaryStage.show();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
