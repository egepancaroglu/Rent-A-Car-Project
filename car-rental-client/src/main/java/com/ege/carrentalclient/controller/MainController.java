package com.ege.carrentalclient.controller;

import com.ege.carrentalclient.dto.Account;
import com.ege.carrentalclient.dto.Car;
import com.ege.carrentalclient.service.AccountService;
import com.ege.carrentalclient.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.*;

@Controller
public class MainController {

    private final AccountService accountService;

    private final CarService carService;

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public MainController(AccountService accountService, CarService carService, JdbcTemplate jdbcTemplate) {
        this.accountService = accountService;
        this.carService = carService;
        this.jdbcTemplate = jdbcTemplate;
    }
//    @GetMapping("/")
//    public String setCookie(HttpServletResponse response) {
//        // create a cookie
//        Cookie cookie = new Cookie("AdminLogin", "Ege");
//        Cookie cookie1 = new Cookie("BaseCookie", "CarRental");
//
//        cookie.setMaxAge(10);
//        cookie.setSecure(true);
//        cookie.setHttpOnly(true);
//        cookie.setPath("/");
//
//        cookie1.setMaxAge(15);
//        cookie1.setSecure(true);
//        cookie1.setHttpOnly(true);
//        cookie1.setPath("/");
//
//        //add cookie to response
//        response.addCookie(cookie);
//        response.addCookie(cookie1);
//
//        return "index";
//    }

    @GetMapping("/")
    public String mainPage(ModelMap modelMap, Authentication authentication,HttpServletResponse response) {
        List<Car> popularCars = carService.findAllByPopularity();
        if(authentication != null) {

            Account loggedAccount = accountService.findAccountByEmail(authentication.getName());
            modelMap.addAttribute("loggedAccount", loggedAccount);
            if(loggedAccount.getEmail().equals("admin@ryd.com")) {
            }
        }

        Cookie cookie = new Cookie("AdminLogin", "Ege");
        Cookie cookie1 = new Cookie("BaseCookie", "CarRental");


        cookie.setMaxAge(10);
        cookie.setSecure(true);
        cookie.setHttpOnly(true);
        cookie.setPath("/index");


        cookie1.setMaxAge(15);
        cookie1.setSecure(true);
        cookie1.setHttpOnly(true);
        cookie1.setPath("/index");

        response.addCookie(cookie);
        response.addCookie(cookie1);
        modelMap.addAttribute("numberOfRequests", carService.getNumberOfRequests());

        modelMap.addAttribute("popularCars", popularCars);
        return "index";
    }

    @RequestMapping("/")
    public String viewHomePage1(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
        List<Car> popularCars = carService.findAllByPopularity();
        modelMap.addAttribute("popularCars", popularCars);
        // create a cookie
        Cookie cookie = new Cookie("AdminLogin", "Ege");
        Cookie cookie1 = new Cookie("BaseCookie", "CarRental");


        cookie.setMaxAge(15);
        // optional properties
        cookie.setSecure(true);
        cookie.setHttpOnly(true);
        cookie.setPath("/");


        cookie1.setMaxAge(15);
        // optional properties
        cookie1.setSecure(true);
        cookie1.setHttpOnly(true);
        cookie1.setPath("/");

        // add cookie to response
        response.addCookie(cookie);
        response.addCookie(cookie1);

        return "index";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        Account account = new Account();
        model.addAttribute("account", account);
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("account")Account account, BindingResult bindingResult) throws Exception {
        if(bindingResult.hasErrors()) {
            return "register";
        }

        String hashedPassword = hashPassword(account.getPassword());
        account.setPassword(hashedPassword);
        accountService.registerAccount(account);
        insertRoles(account.getEmail(), account.getPassword());
        return "redirect:/";
    }

    @GetMapping("/access-denied")
    public String accessDenied() {
        return "access-denied";
    }

    @GetMapping("/cars/{type}")
    public String carsPage(@PathVariable("type") String type, ModelMap modelMap) {
        List<Car> cars = carService.findAll();
        String capitalizedType = type.substring(0, 1).toUpperCase() + type.substring(1);
        modelMap.addAttribute("cars", cars);
        modelMap.addAttribute("type", capitalizedType);
        return "index";
    }

    private void insertRoles(String email, String password) {
        String sqlUser = String.format("INSERT INTO users (email, password, enabled) VALUES ('%s', '%s', true)", email, password);
        jdbcTemplate.execute(sqlUser);
        String sqlRole = String.format("INSERT INTO user_roles (email, role) VALUES ('%s', '%s')", email, "ROLE_USER");
        jdbcTemplate.execute(sqlRole);
    }

    private String hashPassword(String password) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.encode(password);
    }
}
