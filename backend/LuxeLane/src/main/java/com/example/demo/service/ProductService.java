package com.example.demo.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Product;
import com.example.demo.repo.ProductRepository;

@Service
public class ProductService {
    @Autowired
    private ProductRepository repository;

    public List<Product> findAll() {
        return repository.findAll();
    }

    public Optional<Product> findById(Long id) {
        return repository.findById(id);
    }

    public Product save(Product product) {
        return repository.save(product);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
    private static final String UPLOAD_DIR = System.getProperty("user.dir") + "/uploads/";


    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("File is empty");
        }

        // Ensure upload directory exists
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Generate a unique filename to avoid conflicts
        String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        Path destinationPath = uploadPath.resolve(uniqueFileName);

        // Save the file
        try {
            file.transferTo(destinationPath.toFile());
        } catch (IOException e) {
            throw new IOException("File upload failed: " + e.getMessage(), e);
        }

        return uniqueFileName;
    }
    public String saveMultipleFiles(MultipartFile[] files) throws IOException {
        return Arrays.stream(files)
                     .map(file -> {
                         try {
                             return saveFile(file);
                         } catch (IOException e) {
                             throw new RuntimeException("File upload failed", e);
                         }
                     })
                     .collect(Collectors.joining(",")); 
    }
}
