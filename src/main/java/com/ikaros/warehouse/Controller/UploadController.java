package com.ikaros.warehouse.Controller;

import com.ikaros.warehouse.Dao.ProductRepository;
import com.ikaros.warehouse.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("SpringMVCViewInspection")
@Controller
public class UploadController{

    @Autowired
    private ProductRepository pRepo;

    @RequestMapping(value = "/upload")
    public ModelAndView getUploadPage(){
        ModelAndView mav = new ModelAndView("upload");
        mav.addObject("productUploadSuccess", null);
        mav.addObject("inventoryUploadSuccess", null);
        return mav;
    }

    @RequestMapping(value = "/upload/uploadProduct", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ModelAndView addProductAction(@RequestParam("productCsv") MultipartFile file){
        List<Product> productList = new ArrayList<>();
        ModelAndView mav = new ModelAndView("upload");

        try{
            productList = CsvReader.read(Product.class, file.getInputStream());
            pRepo.saveAll(productList);
            mav.addObject("productUploadSuccess", true);
        }catch (Exception e) {
            System.out.println("" + e);
            mav.addObject("productUploadSuccess", false);
        }
        return mav;
    }
}

