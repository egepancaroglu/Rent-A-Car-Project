package com.ege.carrental.repository;

import com.ege.carrental.entity.Account;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AccountRepository extends CrudRepository<Account, Integer> {
    List<Account> findAll();
    Account findAccountById(Integer id);
    Account findAccountByEmail(String email);
}
