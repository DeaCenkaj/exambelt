package com.betaplan.dea.exambelt.repositories;


import com.betaplan.dea.exambelt.models.Yoga;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;





@Repository
public interface YogaRepository extends CrudRepository<Yoga, Long> {
    List<Yoga> findAll();
    List<Yoga> findByUserIdIs(Long userId);
}