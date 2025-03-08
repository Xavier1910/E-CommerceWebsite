package com.example.demo.controller;


import com.example.demo.model.OrderDetails;
import com.example.demo.model.OrderProducts;
import com.example.demo.repo.OrderDetailsRepository;
import com.example.demo.repo.OrderProductsRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    private OrderDetailsRepository orderDetailsRepository;

    @Autowired
    private OrderProductsRepository orderProductsRepository;
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<OrderDetails>> getUserOrders(@PathVariable Long userId) {
        List<OrderDetails> orders = orderDetailsRepository.findByUserId(userId);

        if (orders.isEmpty()) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.ok(orders);
    }
    @PostMapping("/placeOrder")
    public ResponseEntity<String> placeOrders(@RequestBody OrderDetails orderRequest) {
        // Create and save OrderDetails first
        OrderDetails orderDetails = new OrderDetails();
        orderDetails.setUserId(orderRequest.getUserId());
        orderDetails.setTotalAmount(orderRequest.getTotalAmount());
        orderDetails = orderDetailsRepository.save(orderDetails); // Ensure it's saved first

        // Now save OrderProducts linked to this orderDetails
        for (OrderProducts productRequest : orderRequest.getOrderProducts()) {
            OrderProducts orderProduct = new OrderProducts();
            orderProduct.setOrderDetails(orderDetails); // SET THE FOREIGN KEY
            orderProduct.setProductId(productRequest.getProductId());
            orderProduct.setPrice(productRequest.getPrice());
            orderProduct.setQuantity(productRequest.getQuantity());

            orderProductsRepository.save(orderProduct);
        }

        return ResponseEntity.ok("Order placed successfully");
    }

}

