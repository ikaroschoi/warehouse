package com.ikaros.warehouse.Dao;

import com.ikaros.warehouse.model.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface InventoryRepository extends JpaRepository<Inventory, Integer>{

    @Query(value = "select * from Inventory where product_code = ?1", nativeQuery = true)
    List<Inventory> GetInventoryByCode(String productCode);

    @Query(value = "SELECT * FROM Inventory WHERE location = ?1 AND product_code = ?2", nativeQuery = true)
    Inventory GetInventoryByCodeBylocation(String location, String productCode);

    @Modifying
    @Transactional
    @Query(value = "UPDATE inventory SET quantity = quantity+?1 WHERE id = ?2", nativeQuery = true)
    void addProductQuantity(int quantity, int inventoryId);

    @Modifying
    @Transactional
    @Query(value = "UPDATE inventory SET quantity = quantity-?1 WHERE id = ?2", nativeQuery = true)
    void minusProductQuantity(int quantity, int inventoryId);
}