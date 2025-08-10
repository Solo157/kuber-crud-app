package com.app.kuber_crud_app.repository;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.PersistenceCreator;

@Entity
@Table(name = "users")
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;

    private String firstName;

    private String lastName;

    private String email;

    private String phone;

    @PersistenceCreator
    public User() {}

    public User(String username, String firstName, String lastName, String email, String phone) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

}
