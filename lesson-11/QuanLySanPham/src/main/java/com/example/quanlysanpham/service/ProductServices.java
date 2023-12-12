package com.example.quanlysanpham.service;

import com.example.quanlysanpham.model.Product;

import java.util.List;

public interface ProductServices {
    List<Product> findAll();

    Product save(Product product);

    Product findById(int id);

    void update(int id,Product product );

    void remove(int id);
    List<Product> findByName(String name); // new method

}
