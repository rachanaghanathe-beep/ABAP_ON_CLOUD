CLASS zra_first_session DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zra_first_session IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
   OUT->write(
     EXPORTING
       data   = |ABAP ON CLOUD|
*       name   =
*     RECEIVING
*       output =
   ).

      ENDMETHOD.

ENDCLASS.
