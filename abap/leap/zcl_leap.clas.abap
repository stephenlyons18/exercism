CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.
" The tricky thing here is that a leap year in the Gregorian calendar occurs:

" ```text
" on every year that is evenly divisible by 4
"   except every year that is evenly divisible by 100
"     unless the year is also evenly divisible by 400
" ```

" For example, 1997 is not a leap year, but 1996 is.  1900 is not a leap
" year, but 2000 is.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
    DATA leap TYPE abap_bool.
    leap = abap_false.
    IF year MOD 4 = 0.
      IF year MOD 100 = 0.
        IF year MOD 400 = 0.
          leap = abap_true.
        ENDIF.
      ELSE.
        leap = abap_false.
      ENDIF.
      leap = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
