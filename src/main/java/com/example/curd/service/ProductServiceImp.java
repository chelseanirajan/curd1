package com.example.curd.service;

import com.example.curd.model.Product;
import com.example.curd.repository.ProductRepository;
import com.example.curd.util.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

@Service
public class ProductServiceImp {
    @Autowired
    private ProductRepository repo;

   /* public void save(Product product){
        repo.save(product);
    } */
    public List<Product> findAll(){
        return repo.findAll();
    }
    public Product findById(Long id){
        return repo.findById(id).get();
    }
    public void deleteById(Long id){
        repo.deleteById(id);
    }
    // Store File Data to Database
    public void store(MultipartFile file){
        try {
            List<Product> lstProducts = ExcelUtils.parseExcelFile(file.getInputStream());
            // Save Products to DataBase
            repo.saveAll(lstProducts);
        } catch (IOException e) {
            throw new RuntimeException("FAIL! -> message = " + e.getMessage());
        }
    }

    // Load Data to Excel File
    public ByteArrayInputStream loadFile() {
        List<Product> product = (List<Product>) repo.findAll();

        try {
            ByteArrayInputStream in = ExcelUtils.productsToExcel(product);
            return in;
        } catch (IOException e) {}

        return null;
    }

}
