package com.dd;

import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;

@SpringBootApplication
public class Mainimiz extends Application implements CommandLineRunner  {

    @Autowired
    TableRepository tableRepository;

    public static void main(String[] args) {

        SpringApplication.run(Mainimiz.class, "");
        Application.launch("");
    }

    @Override
    public void run(String... args) throws Exception {


        List<Table> tableIterable = tableRepository.findAll();

        for(Table table : tableIterable){

            System.out.println(table.getKey());
        }
        System.out.println("fsdfdsfsd");
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        primaryStage.setTitle("ListView Experiment 1");

        ListView listView = new ListView();

        listView.getItems().add("Item 1");
        listView.getItems().add("Item 2");
        listView.getItems().add("Item 3");
        listView.getItems().add("Item 1");
        listView.getItems().add("Item 2");
        listView.getItems().add("Item 3");
        listView.getItems().add("Item 1");
        listView.getItems().add("Item 2");
        listView.getItems().add("Item 3");
        listView.getItems().add("Item 1");
        listView.getItems().add("Item 2");
        listView.getItems().add("Item 3");
        listView.getItems().add("Item 1");
        listView.getItems().add("Item 2");
        listView.getItems().add("Item 3");


        Button button = new Button("değiss");
        TextArea textArea = new TextArea();
        Label label = new Label();


        listView.setOnMouseClicked(event -> {
            label.setText (listView.getSelectionModel().getSelectedItems().toString());
            System.out.println();
        });

        button.setOnAction(event -> {
            ObservableList selectedIndices = listView.getSelectionModel().getSelectedIndices();
            selectedIndices.hashCode();
            listView.getItems().set(listView.getSelectionModel().getSelectedIndex(), textArea.getText());
            textArea.setText("");

            /*for(Object o : selectedIndices){
                System.out.println("o = " + o + " (" + o.getClass() + ")");
            }*/
        });


        VBox vBox = new VBox(listView, button,textArea,label);

        Scene scene = new Scene(vBox, 500, 300);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
