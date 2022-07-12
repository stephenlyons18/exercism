CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.
CLASS zcl_reverse_string IMPLEMENTATION.
  METHOD reverse_string.
    DATA reverse_string TYPE STRING.
    DO strlen( input ) TIMES.
      DATA(position) = strlen( input ) - sy-index.
      DATA(letter) = input+position(1).
      CONCATENATE reverse_string letter into reverse_string.
    ENDDO.
    input = reverse_string.
    result = input.
  ENDMETHOD.
ENDCLASS.