package com.ege.carrental.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@Entity
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String brandName;
    private String model;
    private Integer year;
    private String type;
    private Double engineCapacity;
    private Integer horsePower;
    private Integer numberOfCylinders;
    private Double priceForOneDay;
    private String description;
    private Integer timesRented;
    private Integer rentedToUserId;
    private boolean availability;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "car_id")
    private Set<RentalRequest> userRequests;
}
