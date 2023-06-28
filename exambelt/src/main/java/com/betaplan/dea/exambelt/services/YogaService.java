package com.betaplan.dea.exambelt.services;


import com.betaplan.dea.exambelt.models.Yoga;
import com.betaplan.dea.exambelt.repositories.YogaRepository;
import com.betaplan.dea.exambelt.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class YogaService {
@Autowired
private YogaRepository yogaRepo;


    public List<Yoga> allYogas(){
        return yogaRepo.findAll();
    }

    public List<Yoga> myYogas(User user){
        return yogaRepo.findByUserIdIs(user.getId());
    }

    public Yoga addYoga(Yoga yoga) {
        return yogaRepo.save(yoga);
    }

    public Yoga updateYoga(Yoga yoga) {
        return yogaRepo.save(yoga);
    }

    public void deleteYoga(Yoga yoga) {
        yogaRepo.delete(yoga);
    }

    public Yoga findYoga(Long id) {
        Optional<Yoga> optionalYoga = yogaRepo.findById(id);
        if(optionalYoga.isPresent()) {
            return optionalYoga.get();
        }else {
            return null;
        }
    }
}