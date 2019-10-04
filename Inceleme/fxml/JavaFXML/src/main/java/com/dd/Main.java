package com.dd;

import com.singleton.HBoxSingle;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com")
public class Main extends Application implements CommandLineRunner {

    public static Scene scene;


    public static void main(String[] args) {

        SpringApplication.run(Main.class, "");
        launch(Main.class, args);

    }
    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader loader = new FXMLLoader(Main.class.getResource("/FXML/FormIU.fxml"));
        AnchorPane root = loader.load();
        Main.scene = new Scene(root,220,190);
        scene.getStylesheets().add("/FXML/formIU.css");
        primaryStage.setScene(scene);
        primaryStage.show();

    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("başladi");
    }
}
