package com.example.quanlysanpham.service;

import com.example.quanlysanpham.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServicesImpl implements ProductServices{
    private static Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1,new Product(1,"Quat Dien",300000,5,true));
        products.put(2,new Product(2,"Den Dien",50000,4,false));
        products.put(3,new Product(3,"Bep Ga",600000,3,true));
        products.put(4,new Product(4,"Tu Lanh",3000000,2,false));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product save(Product product) {
        return products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product product : products.values()) {
            if (product.getName().equals(name)) {
                result.add(product);
            }
        }
        return result;
    }
}
