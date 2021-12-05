package com.example.app02;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    /*
     * Use the standard Mongo driver API to create a com.mongodb.client.MongoClient instance.
     */
    @Bean
    public MongoClient mongoClient() {
        return MongoClients.create("mongodb://my-mongo:27017/creart");
    }
}
