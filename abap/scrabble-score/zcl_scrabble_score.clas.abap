CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
    " Calculate the score of a word.
    "Split the input string into individual characters.
    SPLIT input INTO input_chars.
    "Initialize the score to 0.
    result = 0.
    "Loop through each character in the input string.
    FOR i IN 0..LENGTH(input_chars)-1.
      "Get the score of the current character.
      LET score = score_of(input_chars[i]).
      "Add the score to the total score.
      result = result + score.
    ENDFOR.


  ENDMETHOD.
  

  METHOD score_of.
    IMPORTING
      input         TYPE string OPTIONAL
    RETURNING
      VALUE(letter_score) TYPE i.
    LET letter_score = 0.
    LET letter = input.
    CASE letter.
      WHEN 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'.
        letter_score = 1.
      WHEN 'D', 'G'.
        letter_score = 2.
      WHEN 'B', 'C', 'M', 'P'.
        letter_score = 3.
      WHEN 'F', 'H', 'V', 'W', 'Y'.
        letter_score = 4.
      WHEN 'K'.
        letter_score = 5.
      WHEN 'J', 'X'.
        letter_score = 8.
      WHEN 'Q', 'Z'.
        letter_score = 10.
    ENDCASE.
    letter_score.
  ENDMETHOD.
  
ENDCLASS.
