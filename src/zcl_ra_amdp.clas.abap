CLASS zcl_ra_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_amdp_marker_hdb.
  interfaces if_oo_adt_classrun.
    class-methods add_numbers
    AMDP OPTIONS CLIENT INDEPENDENT
           Importing
                value(a) type i
                 value(b) type i
           exporting
                value(result) type i.

CLASS-METHODS get_customer_by_id
AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
 IMPORTING
value(i_bp_id) TYPE zra_de_id
EXPORTING
VALUE(e_res) TYPE string.

    CLASS-METHODS get_product_mrp AMDP OPTIONS CDS SESSION CLIENT DEPENDENT IMPORTING
                                    VALUE(i_tax) type i
                                  EXPORTING
                                    VALUE(otab) type zra_tt_product_mrp.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ra_amdp IMPLEMENTATION.
  METHOD add_numbers by dataBASE prOCEDURE FOR HDB LANGUAGE sqLSCRIPT options read-only.

    result := :a + :b;
  ENDMETHOD.

 METHOD get_customer_by_id BY DATABASE PROCEDURE FOR HDB LANGUAGE
SQLSCRIPT
options read-only using zra_bpa.

select concat( 'M/s ', company_name ) as company_name into
e_res from zra_bpa where bp_id = :i_bp_id;
ENDMETHOD.


 METHOD get_product_mrp BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT
                            options read-only
                            USING zra_product.
*   declare variables
    declare lv_Count integer;
    declare i integer;
    declare lv_mrp bigint;
    declare lv_price_d integer;

*   get all the products in a implicit table (like a internal table in abap)
    lt_prod = select * from zra_product;

*   get the record count of the table records
    lv_count := record_count( :lt_prod );

*   loop at each record one by one and calculate the price after discount (dbtable)
    for i in 1..:lv_count do
*   calculate the MRP based on input tax
        lv_price_d := :lt_prod.price[i] * ( 100 - :lt_prod.discount[i] ) / 100;
        lv_mrp := :lv_price_d * ( 100 + :i_tax ) / 100;
*   if the MRP is more than 15k, an additional 10% discount to be applied
        if lv_mrp > 15000 then
            lv_mrp := :lv_mrp * 0.90;
        END IF ;
*   fill the otab for result (like in abap we fill another internal table with data)
        :otab.insert( (
                          :lt_prod.name[i],
                          :lt_prod.category[i],
                          :lt_prod.price[i],
                          :lt_prod.currency[i],
                          :lt_prod.discount[i],
                          :lv_price_d,
                          :lv_mrp
                      ), i );
    END FOR ;

  ENDMETHOD.

  method if_oo_adt_classrun~main.


*    zcl_ra_amdp=>add_numbers(
*      EXPORTING
*        a      = 10
*        b      = 20
*      IMPORTING
*        result = data(lv_result)
*    ).
""TODO: participent must check their BPA table and copy

"bp_id from your table

""Press Ctrl+Shift+A - search your bpa table and press F8
""Copy the bp_id from output and paste here in line 59

*zcl_ra_amdp=>get_customer_by_id(
*EXPORTING
*i_bp_id = '1AF42792E6DC1FE187E10F6881BC14D6'
*IMPORTING
*e_res = data(lv_result)
*).

zcl_ra_amdp=>get_product_mrp(
  EXPORTING
    i_tax = 18
  IMPORTING
    otab  = data(result)
).

   out->write(
   EXPORTING
   data = result
*  name =
*   RECEIVING
*   output =
).

  endMETHOD.



ENDCLASS.
