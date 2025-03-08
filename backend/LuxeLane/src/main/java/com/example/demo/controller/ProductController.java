package com.example.demo.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Product;
import com.example.demo.service.ProductService;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "http://127.0.0.1:5501")  
@RestController
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService service;

    @GetMapping
    public List<Product> getAllProducts() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Product addProduct(@RequestBody Product product) {
        return service.save(product);
    }
    @PostMapping("/add")
    public ResponseEntity<Product> addProduct(
    	    @RequestParam("brand") String brand,
    	    @RequestParam("description") String description,
    	    @RequestParam("category") String category,
    	    @RequestParam("name") String name,
    	    @RequestParam("price") double price,
    	    @RequestPart("preview") MultipartFile previewFile,
    	    @RequestPart("photos") MultipartFile[] photos
    	)  {
        try {
            // Save preview image
            String previewFileName = service.saveFile(previewFile);


            String photoFileName = service.saveMultipleFiles(photos);
            String photoFileNames = previewFileName + ","+photoFileName ;
            // Create and save product
            Product product = new Product();
            product.setBrand(brand);
            product.setDescription(description);
            product.setCategory(category);
            product.setName(name);
            product.setPrice(price);
            product.setPreview(previewFileName);
            product.setPhotos(photoFileNames);

            Product savedProduct = service.save(product);
            return ResponseEntity.ok(savedProduct);

        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }


    @PutMapping("/{id}")
    public ResponseEntity<Product> updateProduct(
            @PathVariable Long id,
            @RequestParam("brand") String brand,
            @RequestParam("description") String description,
            @RequestParam("category") String category,
            @RequestParam("name") String name,
            @RequestParam("price") double price,
            @RequestParam(value = "preview", required = false) MultipartFile preview,
            @RequestParam(value = "photos", required = false) MultipartFile[] photos) {
        
        Optional<Product> existingProductOpt = service.findById(id);

        if (existingProductOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Product product = existingProductOpt.get();
        
        product.setBrand(brand);
        product.setDescription(description);
        product.setCategory(category);
        product.setName(name);
        product.setPrice(price);

        try {
            // Update preview image if a new one is uploaded
            if (preview != null && !preview.isEmpty()) {
                String previewFileName = service.saveFile(preview);
                product.setPreview(previewFileName);
            }

            // Update photos if new ones are uploaded
            if (photos != null && photos.length > 0) {
                String photoFileNames = service.saveMultipleFiles(photos);
                product.setPhotos(photoFileNames);
            }

            Product updatedProduct = service.save(product);
            return ResponseEntity.ok(updatedProduct);

        } catch (IOException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    @GetMapping("/files/{filename}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) throws Exception {
        Path filePath = Paths.get("uploads/").resolve(filename);
        Resource resource = new UrlResource(filePath.toUri());

        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }

        // Detect content type
        String contentType = "application/octet-stream"; // Default binary type
        try {
            contentType = java.nio.file.Files.probeContentType(filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                .header(HttpHeaders.CONTENT_TYPE, contentType) // Set correct content type
                .body(resource);
    }


    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Object> deleteProduct(@PathVariable Long id) {
        return service.findById(id).map(product -> {
            service.deleteById(id);
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.notFound().build());
    }
}

