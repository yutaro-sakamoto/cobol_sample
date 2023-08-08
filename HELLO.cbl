       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MY-NAME PIC X(20).
       PROCEDURE DIVISION.
       MAIN-RTN.
           DISPLAY "Enter your name: " NO ADVANCING.
           ACCEPT  MY-NAME.
           DISPLAY "Hello " MY-NAME.
       MAIN-EXIT.
           STOP RUN
           