package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Address;
import com.example.demo.service.AddressService;

@RestController
@RequestMapping("/addresses")
public class AddressController {

    @Autowired
    private AddressService addressService;

    // Save Address
    @PostMapping("/save")
    public Address saveAddress(@RequestBody Address address) { 	
        return addressService.saveOrUpdateAddress(address);
    }

    @GetMapping("/user/{userId}")
    public Address getAddressesByUserId(@PathVariable Long userId) {
        return addressService.getAddressByUserId(userId);
    }
}

