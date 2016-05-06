# GNAF SSIS Data Loader

Quickly helps you to setup GNAF database for Australian address data. As Australian address data is available as open source, companies might be looking for configuring and integrating address data.
G-NAF is a database of all the physical addresses in Australia.

more details on G-NAF is available at https://data.gov.au/dataset/geocoded-national-address-file-g-naf

Here, I have tried to simplify the loading process as much as possible. Suggestions and contributions are most welcome.

## Project Setup

Follow below steps to load the data to your database:

1) Download the zip file from above link with name "PSMA Geocoded National Address File (G-NAF)ZIP Popular". It will be around 1 gb

2) Create Sql database and run G-NAF\Extras\GNAF_TableCreation_Scripts\create_tables_sqlserver.sql (Ignore the drop table scripts)

3) Execute script G-NAF\Extras\GNAF_TableCreation_Scripts\add_fk_constraints.sql

4) Execute script G-NAF\Extras\GNAF_View_Scripts\address_view.sql (You might need to open the .sql file and change "CREATE OR REPLACE VIEW ADDRESS_VIEW" to "CREATE VIEW ADDRESS_VIEW"

5) Download and execute script attached to this gitub account named BulkImportDataSP.sql. This creates stored procedure to bulk import data which is used by SSIS package

6) Execute ALTER DATABASE GNAF SET RECOVERY SIMPLE;
Above script disables logging while bulk loading the data which makes bulk load faster

7) Now is the time to actually load the data, either open the solution, configure details and run or directly run the package.

8) To configure, ssisconfig.dtsConfig is available in th package, just change the connection string, run the package file, add the configuration path and execute.

## Note
- It might show errors "The connection "" is not found. This error ....".Ignore those as we are going to use connection string from the config file.

- Screenshots attached at the end of this page.

## Code

The package is just 2 step process as below

Step 1. Load Authority Code Data:

![image](https://cloud.githubusercontent.com/assets/397213/14935432/ee4eedec-0f14-11e6-8baa-7cfffe3f50e9.png)

Step 2. Load Standard Code Data:

![image](https://cloud.githubusercontent.com/assets/397213/14935441/210be7c6-0f15-11e6-8d7d-d4c5cf885d0b.png)

## Performance

![image](https://cloud.githubusercontent.com/assets/397213/14935371/82416bc2-0f12-11e6-8683-bb12a3bc0d02.png)

## Helpful tips

- Loading the data to cloud is pretty simple, create a virtual machine with sql database and run the package, you can download the data files directly from the VM from data.gov url
- Do not try using Azure sql database as loading get difficult rather use VM
- Sql view "Address_View" is already provided with all required address related data

## Screenshots:
![image](https://cloud.githubusercontent.com/assets/397213/14935096/32686ee2-0f09-11e6-9d51-c864f6a4c720.png)

![image](https://cloud.githubusercontent.com/assets/397213/14935109/8b9bae34-0f09-11e6-8459-2e1e94da136e.png)

![image](https://cloud.githubusercontent.com/assets/397213/14935124/0a5153dc-0f0a-11e6-9f69-e934eece2f59.png)

![image](https://cloud.githubusercontent.com/assets/397213/14935146/c0f91d0e-0f0a-11e6-8503-d91cc29e8d1f.png)

![image](https://cloud.githubusercontent.com/assets/397213/14935291/3b6afa4a-0f0f-11e6-88d2-ddd30b528f83.png)

## Contributing changes

- Feel free to contribute code changes for updates and optimization.
 
## License

Code released under the [MIT license](https://github.com/rohitsies/GNAF-SSIS-Data-Loader/blob/master/LICENSE).

