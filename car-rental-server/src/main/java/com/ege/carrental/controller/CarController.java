package com.ege.carrental.controller;

import com.ege.carrental.entity.Car;
import com.ege.carrental.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/car")
public class CarController {

    private final CarService carService;

    @Autowired
    public CarController(CarService carService) {
        this.carService = carService;
    }

    @GetMapping("/show/all")
    public List<Car> showAllCars() {
        return carService.showAllCars();
    }

    @GetMapping("/show/all/popular")
    public List<Car> showAllCarsByPopularity() {
        return carService.showAllCarsByPopularity();
    }

    @GetMapping("/show/brand/{brandName}")
    public List<Car> showCarsByBrandName(@PathVariable("brandName") String brandName) {
        return carService.showCarsByBrandName(brandName);
    }

    @GetMapping("/show/model/{model}")
    public List<Car> showCarsByModel(@PathVariable("model") String model) {
        return carService.showCarsByModel(model);
    }

    @GetMapping("/show/id/{id}")
    public Car showCarById(@PathVariable("id") Integer id) {
        return carService.showCarById(id);
    }

    @PostMapping("/add")
    public ResponseEntity<String> addNewCar(@RequestBody Car car) {
        carService.save(car);
        return new ResponseEntity<>("New car has been added", HttpStatus.CREATED);
    }

    @PutMapping("/update")
    public ResponseEntity<String> updateCar(@RequestBody Car car) {
        carService.save(car);
        return new ResponseEntity<>("Car has been updated", HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteCar(@PathVariable("id") Integer id) {
        carService.delete(id);
        return new ResponseEntity<>("Car has been deleted", HttpStatus.OK);
    }

    @GetMapping("/requests")
    public Integer getNumberOfRequests() {
        return carService.getNumberOfRequests();
    }
}
