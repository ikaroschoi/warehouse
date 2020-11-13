package com.ikaros.warehouse.Controller;
import com.ikaros.warehouse.model.Inventory;
import com.ikaros.warehouse.Dao.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
@Controller
public class SearchController {

    @Autowired
    private InventoryRepository iRepo;

    @RequestMapping("/search")
    public ModelAndView getSearchPage(){
        return new ModelAndView("search");
    }

    @RequestMapping(value = "/search/findProduct", method = RequestMethod.POST)
    public ModelAndView findProduct(@RequestParam("productCode") String productCode){

        ModelAndView mav = new ModelAndView("search");

        List<Inventory> inventoryList = iRepo.GetInventoryByCode(productCode.trim());

        mav.addObject("inventoryList", inventoryList);

        return mav;
    }
}