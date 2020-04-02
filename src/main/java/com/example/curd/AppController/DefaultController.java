package com.example.curd.AppController;


import com.example.curd.model.Product;
import com.example.curd.service.ProductServiceImp;
import com.example.curd.util.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller

public class DefaultController {
    @Autowired
    private ProductServiceImp prod;

    @GetMapping("/")
    public String index(Model model) {

        List<Product> all = prod.findAll();
        model.addAttribute("all", all);
        return "welcome";
    }

    @GetMapping("getForm")
      public String getForm(@ModelAttribute("userForm") Product userForm) {
        return "add_product";
    }

    @GetMapping("excel")
    public String getExcel() {
        return "add-excel";
    }

    @PostMapping("newexcel")
    public String uploadMultipartFile(@RequestParam("uploadfile") MultipartFile file, Model model) {
        try {
            prod.store(file);
            model.addAttribute("message", "File uploaded successfully!");
        } catch (Exception e) {
            model.addAttribute("message", "Fail! -> uploaded filename: " + file.getOriginalFilename());

        }
        return "add-excel";
    }

/*
    @PostMapping("new")
    public ModelAndView showNewProductPage(HttpServletRequest httpServletRequest,
                                           @ModelAttribute("userForm") Product userForm,
                                           RedirectAttributes redirectAttrs, BindingResult result) {
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "new");
            return new ModelAndView("add_product");
        }
        prod.save(userForm);
        //redirectAttrs.addFlashAttribute("userForm", personalDetail);
        return new ModelAndView("redirect:/");

    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam("id") Long id, Model model) {
        prod.deleteById(id);
        model.addAttribute("all", prod.findAll());
        return "welcome";
    }

    @GetMapping("/edit")
    public String showBookdById(@RequestParam("id") Long id, Model model) {
        Product product = prod.findById(id);
        model.addAttribute("all", product);
        return "edit-product";
    }
    @PostMapping("/update")
    public String updateBook(@RequestParam("id") Long id, @Valid @ModelAttribute Product product, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "edit-product";
        }

        prod.save(product);
        model.addAttribute("all", prod.findAll());
        return "welcome";
    }

 */

}

