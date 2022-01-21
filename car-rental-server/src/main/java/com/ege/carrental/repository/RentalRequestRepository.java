package com.ege.carrental.repository;

import com.ege.carrental.entity.RentalRequest;
import org.springframework.data.repository.CrudRepository;

public interface RentalRequestRepository extends CrudRepository<RentalRequest, Integer> {
    void deleteRentalRequestsByAccountId(Integer id);
    long count();
}
