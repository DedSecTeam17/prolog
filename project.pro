DOMAINS 
file=myfile

 person , password = symbol
   

%////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

%////////////seller's info////////////////////////////////////
sellerNumber,sellerSalary,sellerCommision, sellerAge = integer
sellerFname,sellerMname,sellerLname,sellerGender=string

%///////////medicine's info//////////////////////////////////
medicineNumber,medicineCompanyNumber,medicineCategoryNumber,medicineQuantity,medicinePrice = integer
medicineName,medicineType = string
medicineProductionDate,medicineExpDate=integer

transactionNumber, sellesrNumber, itemsQuantity, itemsPrice,dateOfTransaction=integer
itemsName,itemsType=string

expiredMedicine=string

%///////////category's info//////////////////////////////////
categoryName = string
categoryNumber = integer

%//////////comoany's info//////////////////////////////////
companyName = string
companyNumber =integer
transaction_Number=integer
year,month,day=integer


number_of_transaction=integer
mybill=integer
%////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





FACTS - sellers
seller(sellerNumber,sellerFname,sellerMname,sellerLname,sellerAge,sellerGender,sellerSalary,sellerCommision)

FACTS - medicines
medicine(medicineNumber,medicineName,medicineType,medicineCompanyNumber,medicineCategoryNumber,medicineQuantity,medicinePrice,medicineProductionDate,medicineExpDate)

FACTS - categories
category(categoryNumber,categoryName)

FACTS - companies
company(companyNumber,companyName)

FACTS - expiMedicines
expiredMedicines(expiredMedicine)

FACTS - transaction
transaction(transactionNumber, sellesrNumber,itemsName,itemsType, itemsQuantity, itemsPrice,year,month,day)

FACTS - numberOfTransaction
numberOfTransaction(number_of_transaction)


FACTS - bill
bill(mybill)

PREDICATES
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  login predicates begin
   nondeterm   password_of(person,password)
   nondeterm  login
   nondeterm count(integer)
   nondeterm  message(integer)
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  login predicates END



 
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ MENUS PREDICATES  begin
nondeterm starting_menu
nondeterm admen_menu
nondeterm admen_menu_insert
nondeterm admen_menu_update
nondeterm admen_menu_delete
nondeterm admen_menu_Display
nondeterm admen_menu_search
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ MENUS PREDICATES  END



nondeterm main_section(integer)
nondeterm admin_choice_section(integer)
nondeterm insertion_section(integer)
nondeterm deleteion_section(integer)
nondeterm update_section(integer)
nondeterm display_section(integer)
nondeterm search_section(integer)
nondeterm expired_product(integer,string)

nondeterm show_medicines_in_category(integer)




nondeterm check_the_quantity(integer,integer)

nondeterm add_commision_to_user(integer)

nondeterm seller_section(integer,integer)

nondeterm bills_calculation(integer)

nondeterm check_seller_num(integer)

nondeterm lot_withpanadol(integer)

nondeterm reloading_files


nondeterm seller_option(integer)





CLAUSES 
reloading_files:-



consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\numtransaction.txt",numberOfTransaction),
consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\sellers.txt",sellers),
consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\medicines.txt",medicines),
consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\categories.txt",categories),
consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\companies.txt",companies),
consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\expired.txt",expiMedicines),
consult("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\transaction.txt",transaction).

%##################################################################################################### MAIN MENU
starting_menu:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome User "),nl,
 write("-----------------------------------------------------------------"),nl,
 write("\t"),nl
,write("\t  1-Admin"),nl,
 write("\t  2-Saller"),nl,
 write("\t  3-Exit"),nl,
write("please Enter your choice :"),nl,
readint(_choice),main_section(_choice),nl,starting_menu.
%##################################################################################################### MAIN MENU 








%##################################################################################################### ADMEN MENU 
 admen_menu:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome Admin "),nl,
 write("-----------------------------------------------------------------"),nl,
 write("\t"),nl,
write("\t 1-insert"),nl,
write("\t 2-update"),nl,
write("\t 3-delete"),nl,
write("\t 4-display"),nl,
write("\t 5-search"),nl,
write("\t 6-log out"),nl,
write("please Enter your choice :"),nl,
readint(_choice),admin_choice_section(_choice),admen_menu.
%##################################################################################################### ADMEN MENU 






%##################################################################################################### INSERT MENU 
 admen_menu_insert:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome to insert operation "),nl,
 write("-----------------------------------------------------------------"),nl,
 write("\t"),nl,
write("\t 1-Insert new seller"),nl,
write("\t 2-Insert new medicine"),nl,
write("\t 3-Insert new category"),nl,
write("\t 4-Insert new company"),nl,
write("\t 5-back to main menu"),nl,
write("please Enter your choice :"),nl,
readint(_choice),insertion_section(_choice),nl,admen_menu_insert.
%##################################################################################################### INSERT MENU 








%##################################################################################################### UPDATE MENU 
admen_menu_update:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome to update operation "),nl,
 write("-----------------------------------------------------------------"),nl,
 write("\t"),nl,
write("\t 1-Update details of seller"),nl,
write("\t 2-Update details of medicine"),nl,
write("\t 3-back to main menu"),nl,
write("please Enter your choice :"),nl,
readint(_choice),update_section(_choice),nl,admen_menu_update.
%##################################################################################################### UPDATE MENU 






%##################################################################################################### DELETE MENU 
admen_menu_delete:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome to Delete operation "),nl,
 write("-----------------------------------------------------------------"),nl,
  write("\t"),nl,
write("\t 1-Delete specific seller."),nl,
write("\t 2-Delete specific medicine."),nl,
write("\t 3-Delete specific category."),nl,
write("\t 4-Delete specific category."),nl,
write("\t 5-back to main menu"),nl,
write("please Enter your choice :"),nl,
readint(_choice),deleteion_section(_choice),nl,admen_menu_delete.
%##################################################################################################### DELETE MENU 









%##################################################################################################### DISPLAY MENU 
admen_menu_Display:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome to Display operation "),nl,
 write("-----------------------------------------------------------------"),nl,
  write("\t"),nl,
write("\t 1.Display all sellers (all details of seller)."),nl,
write("\t 2.Display all medicines (all details of medicine). "),nl,
write("\t 3.Display all categories (all details of category). "),nl,
write("\t 4.Display all companies (all details of company)."),nl,
write("\t 5.Display all expired medicines."),nl,
write("\t 6.Display medicines purchased a lot with the panadol."),nl,
write("\t 7.Display all transaction (all details of seller transaction)."),nl,
write("\t 8-back to main menu"),nl,
write("please Enter your choice :"),nl,
readint(_choice),display_section(_choice),admen_menu_Display.
%##################################################################################################### DISPLAY MENU 







%##################################################################################################### SEARCH MENU 
admen_menu_search:-
 write("-----------------------------------------------------------------"),nl,
 write("Welcome to Delete operation "),nl,
 write("-----------------------------------------------------------------"),nl,
  write("\t"),nl,
write("\t 1-search specific seller."),nl,
write("\t 2-search specific medicine."),nl,
write("\t 3-search specific category."),nl,
write("\t 4-search specific category."),nl,
write("\t 5-back to main menu"),nl,
write("please Enter your choice :"),nl,
readint(_choice),search_section(_choice),nl,admen_menu_search.
%##################################################################################################### SEARCH MENU 

 
 
 


 
 
 
 
 %******************************ADMENSTERATOR SECTION BEGIN
main_section(1):-
write("admin section"),login,nl.
 %******************************ADMENSTERATOR SECTION End

%//////saller sectom

main_section(2):-
write("saller section"),nl,write("\t Display all categories  \n"),
write("Enter saller number: \n "),readint(SellesrNumber),
check_seller_num(SellesrNumber),
write("\t 1-buy medicine \n"),
write("\t 2-Exit \n"),write("Enter your choice : \n"),readint(_sellerchoice),seller_section(_sellerchoice,SellesrNumber).






main_section(3):-
write("EXIT..."),exit.




main_section(_):-
write("invalid choice \n"),starting_menu.


seller_option(_sellerid):-
write("\t 1-buy medicine \n"),
write("\t 2-Exit \n"),write("Enter your choice : \n"),readint(_sellerchoice),seller_section(_sellerchoice,_sellerid).

%//////saller sectom

seller_section(1,SellesrNumber):-
display_section(3),
write("Enter your specific categories number : \n")
,readint(_catnum),
show_medicines_in_category(_catnum),
write("Enter your specific medicines number : \n"),
readint(MedicineNum),
write("\n"),
medicine(MedicineNum,MedicineName,MedicineType,_,_,_,MedicinePrice,_,_),
write("Enter your quantity: \n"),
readint(_medicinequant),check_the_quantity(MedicineNum,_medicinequant),
write("\n"),

Mn=MedicineName,Mt=MedicineType,Mq=_medicinequant,Mp=MedicinePrice,date(Year, Month, Day),Snum=SellesrNumber,numberOfTransaction(_num),Newnum=_num+1,
retract(numberOfTransaction(_num),numberOfTransaction),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\numtransaction.txt",numberOfTransaction),


assert(numberOfTransaction(Newnum),numberOfTransaction),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\numtransaction.txt",numberOfTransaction),
numberOfTransaction(_lastnum),_mn=_lastnum,
assert(transaction(_mn, Snum,Mn,Mt,Mq , Mp,Year, Month, Day),transaction),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\transaction.txt",transaction),seller_option(Snum).




seller_section(2,SellesrNumber):-
bills_calculation(SellesrNumber),add_commision_to_user(SellesrNumber),write("sale operation complete successfully \n"),
write("exit... \n"),starting_menu.


%################################################## Menu item
admin_choice_section(1):-
admen_menu_insert.

admin_choice_section(2):-

admen_menu_update.
admin_choice_section(3):-

admen_menu_delete.
admin_choice_section(4):-

admen_menu_Display.
admin_choice_section(5):-

admen_menu_search.
admin_choice_section(6):-
starting_menu.

admin_choice_section(_):-
write("please Enter valid choice !!"),nl,starting_menu.





%******************* insert Menu Section  *****************************************
%INSERTION(){
insertion_section(1):-
write("Seller's number "),
readint(SellerNumber),
write("Seller's first name "),
readln(SellerFname),
write("Seller's middle name "),
readln(SellerMname),
write("Seller's last name "),
readln(SsellerLname),
write("Seller's Age "),
readint(SellerAge),
write("Seller's Gender "),
readln(SellerGender),
write("Seller's Salary "),
readint(SellerSalary),
write("Seller's Commission "),
readint(SellerComission),
assert(seller(SellerNumber,SellerFname,SellerMname,SsellerLname,SellerAge,SellerGender,SellerSalary,SellerComission),sellers),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\sellers.txt",sellers).


insertion_section(2):-
write("Medicine's Number "),
readint(MedicineNum),
write("Medicine's Name "),
readln(MedicineName),
write("Medicine's type "),
readln(MedicineType),
write("Medicine's Company Number "),
readint(MedicineCompanyNumber),
write("Medicine's Category Number "),
readint(MedicineCategoryNumber),
write("Medicine's Quantity "),
readint(MedicineQuantity),
write("Medicine's Price"),
readint(MedicinePrice),
write("Medicine's Production Date"),
readint(MedicineProdDate),
write("Medicine's Expiration Date"),
readint(MedicineExpDate),
assert(medicine(MedicineNum,MedicineName,MedicineType,MedicineCompanyNumber,MedicineCategoryNumber,MedicineQuantity,MedicinePrice,MedicineProdDate,MedicineExpDate),medicines),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\medicines.txt",medicines),expired_product(MedicineExpDate,MedicineName).
  
  

  
  
insertion_section(3):-
write("Category's number "),
readint(CategoryNumber),
write("Category's name "),
readln(CategoryName),
assert(category(CategoryNumber,CategoryName),categories),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\categories.txt",categories).









insertion_section(4):-
write("Company's number "),
readint(CompanyNumber),
write("Company's name "),
readln(CompanyName),
assert(company(CompanyNumber,CompanyName),companies),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\companies.txt",companies).





insertion_section(5):-write("exit to main menu"),admen_menu.
insertion_section(_):-write("invalid choice \t \n"),admen_menu_insert.
%}






%******************* Delete Menu Section ***********************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************




%DELETE{
deleteion_section(1):-
write("seller's number to delete : \n"),
readint(_sellerToDelete),
retract(seller(_sellerToDelete,_,_,_,_,_,_,_),sellers),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\sellers.txt",sellers).


deleteion_section(2):-
write("medicine number to delete : \n"),
readint(_medicineToDelete),
retract(medicine(_medicineToDelete,_,_,_,_,_,_,_,_),medicines),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\medicines.txt",medicines).

deleteion_section(3):-
write("category number to delete : \n"),
readint(_categoryToDelete),
retract(category(_categoryToDelete,_),categories),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\categories.txt",categories).

deleteion_section(4):-
write("company number to delete : \n"),
readint(_companyToDelete),
retract(company(_companyToDelete,_),companies),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\companies.txt",companies).

deleteion_section(5):-write("exit to main menu"),admen_menu.

deleteion_section(_):-write("invalid choice \n"),admen_menu_delete.

%}




%*******************************************************End of deletion******************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************







%******************* *************************** Update Menu  Section *****************************************%*************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%UPDATE{
update_section(1):-
write("seller's number to update : \n"),
readint(_sellerToUpdate),
write("Seller's first  name "),
readln(SellerFname),
write("Seller's middle  name "),
readln(SellerMname),
write("Seller's last name "),
readln(SsellerLname),
write("Seller's Age "),
readint(SellerAge),
write("Seller's Gender "),
readln(SellerGender),
write("Seller's Salary "),
readint(SellerSalary),
write("Seller's Commission "),
readint(SellerComission),

retract(seller(_sellerToUpdate,_,_,_,_,_,_,_),sellers),

assert(seller(_sellerToUpdate,SellerFname,SellerMname,SsellerLname,SellerAge,SellerGender,SellerSalary,SellerComission),sellers),

save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\sellers.txt",sellers).



update_section(2):-
write("Medicine's number to update : \n"),
readint(_medicineNumber),
write("Medicine's Quantity "),
readint(MedicineQuantity),
write("Medicine's Price"),
readint(MedicinePrice),

medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,_medicineQuantity,_medicinePrice,_medicineProductionDate,_medicineExpDate),
retract(medicine(_medicineToUpdate,_,_,_,_,_,_,_,_),medicines),
assert(medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,MedicineQuantity,MedicinePrice,_medicineProductionDate,_medicineExpDate),medicines),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\medicines.txt",medicines).


update_section(3):-write("exit to main menu"),admen_menu.


update_section(_):-write("invalid choice \t \n"),admen_menu_update.
%}




%****************************************************************End of update ********************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************




search_section(1):-

write("Seller's number:"),
readint(_sellerNumber),
write("\n"),
seller(_sellerNumber,SellerFname,SellerMname,_sellerLname,_sellerAge,_sellerGender,_sellerSalary,_sellerCommision),
write("#############################################################\n"),
write("Seller                                      ##                                Seller detail                             \n"),
write("#############################################################\n"),
write("Seller      number\t\t+",_sellerNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Seller last   name\t\t+",SellerFname,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller middle name\t\t+",SellerMname,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller last   name\t\t+",_sellerLname,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller age        \t\t+",_sellerAge,"     \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller gender     \t\t+",_sellerGender,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller salary     \t\t+",_sellerSalary,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller commision  \t\t+",_sellerCommision,"\n"),
write("#############################################################\n"),
write("\n").


search_section(2):-
write("Medicine's number:"),
readint(_medicineNumber),
write("\n"),
medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,_medicineQuantity,_medicinePrice,_medicineProductionDate,_medicineExpDate),
write("#############################################################\n"),
write("MEDDICINE                                      ##                                MEDICINE detail                             \n"),
write("#############################################################\n"),
write("medicine number         \t\t+",_medicineNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("medicine name           \t\t+",_medicineName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine type           \t\t+",_medicineType,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine company number \t\t+",_medicineCompanyNumber,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine category number\t\t+",_medicineCategoryNumber,"     \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine quantity       \t\t+",_medicineQuantity,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine price          \t\t+",_medicinePrice,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine ProductionDate \t\t+",_medicineProductionDate,"\n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine     Expireson  Date\t\t+",_medicineExpDate,"  \n"),
write("#############################################################\n"),
write("\n").



search_section(3):-
write("Enter  category's number:"),
readint(_categotyNumber),
category(_categoryNumber,_categoryName),
write("\n"),
write("#############################################################\n"),
write("category                                      ##                                category detail                             \n"),
write("#############################################################\n"),
write("Category number        \t\t+",_categoryNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Category name          \t\t+",_categoryName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("#############################################################\n"),
write("\n").



search_section(4):-
write("Enter  company's number:"),
readint(_companyNumber),
company(_companyNumber,__companyName),
write("#############################################################\n"),
write("Company                                      ##                                Company detail                             \n"),
write("#############################################################\n"),
write("Company number        \t\t+",_companyNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Company name          \t\t+",__companyName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("#############################################################\n"),
write("\n").
search_section(5):-
write("invalid choice \t \n"),nl,admen_menu.


search_section(_):-
write("invalid choice \t \n"),admen_menu_search.




%******************* Display Menu Section *****************************************%*****************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************
%****************************************************************************************************************************************************************************




%******************* Display all sellers *****************************************%*****************************************************************************************
display_section(1):-write("\t Display all sellers  \n"),
seller(_sellerNumber,SellerFname,SellerMname,_sellerLname,_sellerAge,_sellerGender,_sellerSalary,_sellerCommision),
write("#############################################################\n"),
write("Seller                                      ##                                Seller detail                             \n"),
write("#############################################################\n"),
write("Seller      number\t\t+",_sellerNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Seller last   name\t\t+",SellerFname,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller middle name\t\t+",SellerMname,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller last   name\t\t+",_sellerLname,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller age        \t\t+",_sellerAge,"     \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller gender     \t\t+",_sellerGender,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller salary     \t\t+",_sellerSalary,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Seller commision  \t\t+",_sellerCommision,"\n"),
write("#############################################################\n"),
write("\n"),
fail;true.



%******************* Display all medicines *****************************************%*****************************************************************************************
display_section(2):-write("\t Display all medicines \n"),
write("\n"),
medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,_medicineQuantity,_medicinePrice,_medicineProductionDate,_medicineExpDate),


write("#############################################################\n"),
write("MEDDICINE                                      ##                                MEDICINE detail                             \n"),
write("#############################################################\n"),
write("medicine number         \t\t+",_medicineNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("medicine name           \t\t+",_medicineName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine type           \t\t+",_medicineType,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine company number \t\t+",_medicineCompanyNumber,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine category number\t\t+",_medicineCategoryNumber,"     \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine quantity       \t\t+",_medicineQuantity,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine price          \t\t+",_medicinePrice,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine ProductionDate \t\t+",_medicineProductionDate,"\n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine     Expireson  Date\t\t+",_medicineExpDate,"  \n"),
write("#############################################################\n"),
write("\n"),
fail;true.


%******************* Display all categories  *****************************************%*****************************************************************************************
display_section(3):-write("\t Display all categories  \n"),
category(_categoryNumber,_categoryName),
write("\n"),
write("#############################################################\n"),
write("category                                      ##                                category detail                             \n"),
write("#############################################################\n"),
write("Category number        \t\t+",_categoryNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Category name          \t\t+",_categoryName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("#############################################################\n"),
write("\n"),
fail;true.


%******************* Display all companies *****************************************%*****************************************************************************************
display_section(4):-write("\t Display all companies  \n"),

company(_companyNumber,__companyName),
write("#############################################################\n"),
write("Company                                      ##                                Company detail                             \n"),
write("#############################################################\n"),
write("Company number        \t\t+",_companyNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Company name          \t\t+",__companyName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("#############################################################\n"),
write("\n"),
fail;true.





display_section(5):-

write("\t Display all Expired Medicine  \n"),
expiredMedicines(ExpiredMedicine),

write("#############################################################\n"),
write("Expired Medicine                                      ##                                Expired Medicine detail                             \n"),
write("#############################################################\n"),
write("Expired Medicine name       \t\t+",ExpiredMedicine,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("#############################################################\n"),
write("\n"),
fail;true.



display_section(6):-write("section 7 "),write("\t Display all medicines pureched a lot with panadol  \n"),
transaction(_, SellesrNumber,"panadol",_, _, _,_,_,_),
lot_withpanadol(SellesrNumber),fail;true.



display_section(7):-write("\t Display all transactions  \n"),

transaction(TransactonNumer, SellesrNumber,ItemsName,ItemsType, ItemsQuantity, ItemsPrice,Year,Month,Day),
write("#############################################################\n"),
write("MEDDICINE                                      ##                                MEDICINE detail                             \n"),
write("#############################################################\n"),
write("Transaction number         \t\t+",TransactonNumer,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("Seller  Number             \t\t+",SellesrNumber,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Item name                  \t\t+",ItemsName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Items Type                 \t\t+",ItemsType,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Items quantity             \t\t+",ItemsQuantity,"     \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Items price                \t\t+",ItemsPrice,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Year                       \t\t\t+",Year,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Month                      \t\t+",Month,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("Day                        \t\t\t+",Day,"    \n"),
write("#############################################################\n"),
write("\n"),
fail;true.



display_section(8):-write("exit to main menu"),admen_menu.
display_section(_):-write("invalid choice \t \n"),admen_menu_Display.




lot_withpanadol(_sellerid):-
transaction(_transactionnum, _sellerid,ItemsName,_, _, _,_,_,_),
not(ItemsName="panadol"),
write(ItemsName,"\n"),write("in transaction NO:",_transactionnum,"\n"),fail;true.







expired_product(_medicineExpDate,_medicineName):-date(Year,_,_),
_medicineExpDate<=Year,
assert(expiredMedicines(_medicineName),expiMedicines),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\expired.txt",expiMedicines),fail
;true.






show_medicines_in_category(_medicineCategoryNumber):-
write("\n"),
medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,_medicineQuantity,_medicinePrice,_medicineProductionDate,_medicineExpDate),
write("#############################################################\n"),
write("MEDDICINE                                      ##                                MEDICINE detail                             \n"),
write("#############################################################\n"),
write("medicine number         \t\t+",_medicineNumber,"  \n" ),
write("---------------------------------------------------------------------------------------------------------------------### \n"),
write("medicine name           \t\t+",_medicineName,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine type           \t\t+",_medicineType,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine company number \t\t+",_medicineCompanyNumber,"    \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine category number\t\t+",_medicineCategoryNumber,"     \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine quantity       \t\t+",_medicineQuantity,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine price          \t\t+",_medicinePrice,"  \n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine ProductionDate \t\t+",_medicineProductionDate,"\n"),
write("---------------------------------------------------------------------------------------------------------------------###\n"),
write("medicine     Expireson  Date\t\t+",_medicineExpDate,"  \n"),
write("#############################################################\n"),
write("\n"),fail;true.





%---------------------------------------------------------
check_the_quantity(_medicineNumber,_medicinequant):-
write("\n"),
medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,_medicineQuantity,_medicinePrice,_medicineProductionDate,_medicineExpDate),
_medicineQuantity<=_medicineQuantity,
_New_medicineQuantity=_medicineQuantity-_medicinequant,
retract(medicine(_medicineNumber,_,_,_,_,_,_,_,_),medicines),
assert(medicine(_medicineNumber,_medicineName,_medicineType,_medicineCompanyNumber,_medicineCategoryNumber,_New_medicineQuantity,_medicinePrice,_medicineProductionDate,_medicineExpDate),medicines),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\medicines.txt",medicines).




check_the_quantity(_medicineid,_medicinequant):-
write("\n"),
medicine(_medicineid,_,_,_,_,_medicineQuantity,_,_,_),_medicinequant<_medicineQuantity,
write("there are no enough quantity for this medicines \n").

%---------------------------------------------------------







bills_calculation(_sellerid):-
transaction(_TN, _sellerid,_,_, ItemsQuantity, ItemsPrice,_,_,_),
_pill=ItemsQuantity*ItemsPrice,write(" bill  calculate: for this transaction:",_TN,"\t ",_pill,"SDG \n"),fail;true.





add_commision_to_user(_userid):-
write("\n"),
seller(_userid,SellerFname,SellerMname,SsellerLname,_sellerAge,_sellerGender,_sellerSalary,_),
retract(seller(_userid,_,_,_,_,_,Sellery,Comission),sellers),
Seller_Comission=Sellery*10/100,
_newComission=Comission+Seller_Comission,
assert(seller(_userid,SellerFname,SellerMname,SsellerLname,_sellerAge,_sellerGender,_sellerSalary,_newComission),sellers),
save("C:\\VIP\\BIN\\WIN\\32\\projectfiles\\sellers.txt",sellers).




check_seller_num(_sellerid):-
seller(_sellerid,SellerFname,SellerMname,SsellerLname,_,_,_,_),
_sid=_sellerid,
write("welcome  : \t",SellerFname,"\t",SellerMname,"\t",SsellerLname),
write("\n").



















password_of("mohammed","1337").
password_of("khalid","1347").
password_of("ali","1357").
    password_of("test",pr).
    
    login :-

        write("Welcome!   Please Login \n"),nl,
        count(3),
        write("Invalid user name or password"),nl,beep,starting_menu.
        
    login :-
        write("Login Successful"),nl,admen_menu.
        
    count(X) :-
      X <> 0,
        write("\t Enter UserName : \n"),
        readln(Username),
        write("\t Enter Password : \n"),
        readln(Password),
        not(password_of(Username,Password)),
        Y = X - 1,

        message(Y),
        count(Y).
    count(0).        
    
    message(X) :-
        X <> 0,
        write("Invalid user name or password!\n"),beep.
        
    message(0).

%**************************************************************************************************** *Login section end  *************************************


GOAL

reloading_files,starting_menu.