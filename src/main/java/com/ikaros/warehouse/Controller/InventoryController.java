package com.ikaros.warehouse.Controller;
import com.ikaros.warehouse.Dao.InventoryRepository;
import com.ikaros.warehouse.model.Inventory;
import com.ikaros.warehouse.model.Product;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;
import java.util.List;
@Controller
public class InventoryController {

    @Autowired
    private InventoryRepository iRepo;

    @RequestMapping(value = "/inventory/transfer", method = RequestMethod.GET)
    public ModelAndView getTransferPage(){
        return new ModelAndView("transfer");
    }

    @RequestMapping(value = "/inventory/transfer", method = RequestMethod.POST)
    public ModelAndView transferInventory(@RequestParam("from") String fromLocation, @RequestParam("to") String toLocation, @RequestParam("productCode") String productCode, @RequestParam("quantity") int quantity){
        ModelAndView mav = new ModelAndView("transfer");

        Inventory fromInventory =  iRepo.GetInventoryByCodeBylocation(fromLocation, productCode.trim());
        Inventory toInventory =  iRepo.GetInventoryByCodeBylocation(toLocation, productCode.trim());

        if(fromInventory == null){
            mav.addObject("transferFailed", "Inventory not found in location " + fromLocation);
        }else if(fromInventory.getQuantity() < quantity){
            mav.addObject("transferFailed", "transfer quantity larger than quantity in Inventory " + fromLocation);
        }else if(toInventory == null){
            Inventory newInventory =  iRepo.save(new Inventory(toLocation, quantity, productCode.trim()));
            iRepo.minusProductQuantity(quantity, fromInventory.getId());

            mav.addObject("transferSuccess", "Transfer is successful");
        }else{
            iRepo.addProductQuantity(quantity, toInventory.getId());
            iRepo.minusProductQuantity(quantity, fromInventory.getId());
            mav.addObject("transferSuccess", "Transfer is successful");
        }
        return mav;
    }

    @RequestMapping(value = "/upload/uploadInventory")
    public ModelAndView uploadInventoryAction(@RequestParam("inventoryCsv") MultipartFile file){
        List<Inventory> inventoryList;
        ModelAndView mav = new ModelAndView("upload");

        try{
            inventoryList = CsvReader.read(Inventory.class, file.getInputStream());

            for(Inventory newInventory: inventoryList){
                Inventory checkInventory = iRepo.GetInventoryByCodeBylocation(newInventory.getLocation(), newInventory.getProductCode());

                if(checkInventory != null){
                    iRepo.addProductQuantity(newInventory.getQuantity(), checkInventory.getId());
                }else{
                    iRepo.save(newInventory);
                }
            }

            mav.addObject("inventoryUploadSuccess", true);
        }catch (Exception e) {
            System.out.println("" + e);
            mav.addObject("inventoryUploadSuccess", false);
        }
        return mav;
    }
}
