package com.ikaros.warehouse.Controller;

import com.ikaros.warehouse.Dao.InventoryRepository;
import com.ikaros.warehouse.Dao.ProductRepository;
import com.ikaros.warehouse.model.Inventory;
import com.ikaros.warehouse.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController{

    @Autowired
    private ProductRepository pRepo;

    @Autowired
    private InventoryRepository iRepo;

    @RequestMapping("/")
    public ModelAndView getIndex(){
        List<Product> productList = pRepo.findAll();
        List<Inventory> inventoryList = iRepo.findAll();
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("productList", productList);
        mav.addObject("inventoryList", inventoryList);
        return mav;
    }
}
