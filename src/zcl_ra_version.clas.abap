CLASS zcl_ra_version DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ra_version IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( |SAP Release: { sy-saprl }| ).
  ENDMETHOD.

ENDCLASS.
