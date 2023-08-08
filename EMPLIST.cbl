       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLIST.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE ASSIGN TO "EMPFILE"
                  ORGANIZATION IS INDEXED
                  ACCESS MODE  IS  DYNAMIC
                  RECORD KEY   IS  EMP-CD
                  FILE STATUS  IS  EMP-STS.
       DATA DIVISION.
       FILE SECTION.
       FD  EMP-FILE.
       01  EMP-REC.
           03  EMP-CD         PIC X(04).
           03  EMP-NAME       PIC X(20).
           03  EMP-DPT-CD     PIC X(02).
           03  EMP-ENT-DATE   PIC 9(08).
       WORKING-STORAGE SECTION.
       01  EMP-STS            PIC 9(02).
       01  DSP-REC.
           03  DSP-CD         PIC X(04).
           03  FILLER         PIC X.
           03  DSP-NAME       PIC X(20).
           03  FILLER         PIC XX.
           03  DSP-DPT-CD     PIC X(02).
           03  FILLER         PIC X.
           03  DSP-ENT-DATE   PIC 9999/99/99.
       PROCEDURE DIVISION.
       MAIN-CONTROL SECTION.
       MAIN-000.
           OPEN  INPUT EMP-FILE.
           DISPLAY "*** Employee List ***".
           DISPLAY "ID   Employee Name        Dpt Enter date".
           DISPLAY "---- -------------------- --- ----------".
           PERFORM UNTIL (EMP-STS NOT = ZERO)
             READ EMP-FILE NEXT
               AT END
                  DISPLAY "EOF"
               NOT AT END
                  MOVE   EMP-CD         TO   DSP-CD
                  MOVE   EMP-NAME       TO   DSP-NAME
                  MOVE   EMP-DPT-CD     TO   DSP-DPT-CD
                  MOVE   EMP-ENT-DATE   TO   DSP-ENT-DATE
                  DISPLAY DSP-REC
             END-READ
           END-PERFORM.
           CLOSE EMP-FILE.
       MAIN-900.
           STOP RUN.
