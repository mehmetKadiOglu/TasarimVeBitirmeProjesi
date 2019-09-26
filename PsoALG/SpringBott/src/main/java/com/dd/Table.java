package com.dd;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.persistence.Entity;


@Document(collection = "domain")
public class Table {


    String key;
    String value;


    public Table( String key, String value) {
        this.key = key;
        this.value = value;
    }

    public Table() {

    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
