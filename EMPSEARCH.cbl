       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPSEARCH.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WK-AREA.
         03  WK-CD        PIC X(04).
         03  WK-NAME      PIC X(20).
         03  WK-DPT-CD    PIC X(02).
         03  WK-ENT-DATE  PIC 9(08).
         03  WK-RETURN    PIC 9(01).
       PROCEDURE DIVISION.
       MAIN-RTN.
           DISPLAY "*** Employee Search ***".
           DISPLAY "Code:     : " NO ADVANCING.
           ACCEPT  WK-CD.
           CALL   "EMPREAD" USING WK-CD, WK-NAME, WK-DPT-CD,
                                  WK-ENT-DATE, WK-RETURN.
           IF WK-RETURN = ZERO
              DISPLAY "Name      : " WK-NAME
              DISPLAY "Dept code : " WK-DPT-CD
              DISPLAY "Enter date: " WK-ENT-DATE
           ELSE
              DISPLAY "Employee not found!"
           END-IF.
       MAIN-EXIT.
           STOP RUN.
