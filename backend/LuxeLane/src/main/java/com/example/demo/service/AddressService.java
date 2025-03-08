package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Address;
import com.example.demo.repo.AddressRepository;

@Service
public class AddressService {

    @Autowired
    private AddressRepository addressRepository;

    // Save or Update Address
    public Address saveOrUpdateAddress(Address address) {
        Address existingAddress = addressRepository.findByUserId(address.getUserId());

        if (existingAddress != null) {
            // Update the existing address details
            existingAddress.setFullName(address.getFullName());
            existingAddress.setEmail(address.getEmail());
            existingAddress.setMobileNo(address.getMobileNo());
            existingAddress.setFlatNo(address.getFlatNo());
            existingAddress.setStreetName(address.getStreetName());
            existingAddress.setCity(address.getCity());
            existingAddress.setState(address.getState());
            existingAddress.setPincode(address.getPincode());

            return addressRepository.save(existingAddress);
        }

        // If no existing address, save a new one
        return addressRepository.save(address);
    }

    // Get Address by userId
    public Address getAddressByUserId(Long userId) {
        return addressRepository.findByUserId(userId);
    }
}
