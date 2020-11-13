# Warehouse Inventory System

## Install

Require Java SDK8, MySQL and Maven
Create database and user in MySQL command Line

```
create database warehouse;
create user 'admin'@'localhost' identified by 'admin123';
grant all on warehouse.* to 'admin'@'localhost';
```

## Open web application
```
http://localhost:8080/
```

## Testing dataset
You can use testing data inside 'dataset' folder or use your own dataset.
Upload csv file of product and inventory in 'upload product/inventory' apge.
After upload the test data, you can use 'search' and 'transfer' function otherwise it will show not found error message.

## Homepage
![](https://raw.githubusercontent.com/ikaroschoi/warehouse/main/screen/home.JPG )

## Uploadpage
![](https://raw.githubusercontent.com/ikaroschoi/warehouse/main/screen/upload.JPG )

## Searchpage
![](https://raw.githubusercontent.com/ikaroschoi/warehouse/main/screen/search.JPG)

## Transferpage
![](https://raw.githubusercontent.com/ikaroschoi/warehouse/main/screen/transfer.JPG )

## Daily short
### Day one
* study the requirements
* study spring boot
* design model

### Day two
* develop Dao
* develop Repository
* develop Controller
* connect to MySQL
* debug

### Day three
* develop layout and UI
* develop csv upload function
* debug
* Testing
