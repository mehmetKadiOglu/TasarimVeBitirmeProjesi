package com.tr;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.effect.DropShadow;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;

import javax.swing.*;
import java.net.URL;
import java.util.Random;
import java.util.ResourceBundle;

public class MainController implements Initializable {
    static private  Random rn = new Random();

    @FXML
    TextArea baslikArea;
    @FXML
    Label lblTarih;
    @FXML
    Button buttons;
    @FXML
    VBox naber;
    @FXML
    VBox naber2;
    @FXML
    AnchorPane hirrim;

    int kontrol = 1;

    @Override
    public void initialize(URL location, ResourceBundle resources) {


        naber.getChildren().add(new Label());
        naber.getChildren().add(new Label());
        naber.getChildren().add(new Label());
        naber.getChildren().add(new Label());
        naber.getChildren().add(new Label());


        ((Label)naber.getChildren().get(0)).setText("B");
        ((Label)naber.getChildren().get(1)).setText("Ü");
        ((Label)naber.getChildren().get(2)).setText("Ş");
        ((Label)naber.getChildren().get(3)).setText("R");
        ((Label)naber.getChildren().get(4)).setText("A");

        lblTarih.setText("*-*--*-*");


        buttons.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {

                MainClass.scene.getWindow().setHeight(1500);
                MainClass.scene.getWindow().setY(0);




                /*
                if (kontrol == 1)
                {
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            DropShadow dropShadow2 = new DropShadow();
                            int sayi = 100000;
                            for(int i =0, drop = 0; i<300; i++, drop = ((drop+2)%16)){
                                sayi = sayi + 10 + i;
                                dropShadow2.setOffsetX(drop);
                                dropShadow2.setOffsetY(drop);
                                naber.setEffect(dropShadow2);
                                naber.setLayoutY(naber.getLayoutY()+1);
                                naber.setLayoutX(naber.getLayoutX()+1);
                                naber2.setLayoutX(naber2.getLayoutX()+1.5);
                              //  naber.setStyle("-fx-background-color: #"+String.valueOf(sayi)+"; ");

                                for (int gg = 0; gg<3; gg++ ){
                                       naber.getChildren().get(gg).setStyle("-fx-background-color: #"+MainController.sayiUret()+"; ");

                                }
                                try {
                                    Thread.sleep(10);
                                } catch (InterruptedException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    }).start();
                    kontrol = 0;
                }
                else
                {
                    hirrim.prefWidth(hirrim.getPrefHeight()+ 50);
                    lblTarih.setText("aaa");
                    naber.setLayoutY(-200);
                    naber.setLayoutX(-200);
                    naber2.setLayoutX(0);
                    kontrol = 1;
                }           */

            }

        });
    }

    private static String sayiUret(){

       // return String.valueOf(rn.nextInt((888888 - 111111 ))+111111);
        return String.valueOf(156205);
    }

}
