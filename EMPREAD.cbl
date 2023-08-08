       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPREAD.
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
       01  EMP-STS            PIC  9(02).
       LINKAGE SECTION.
       01  LK-CD              PIC X(04).
       01  LK-NAME            PIC X(20).
       01  LK-DPT-CD          PIC X(02).
       01  LK-ENT-DATE        PIC 9(08).
       01  LK-RETURN          PIC 9(01).
       PROCEDURE DIVISION     USING     LK-CD, LK-NAME, LK-DPT-CD,
                                        LK-ENT-DATE, LK-RETURN.
       MAIN-CONTROL SECTION.
       MAIN-000.
           INITIALIZE EMP-REC.
           MOVE  ZERO         TO   LK-RETURN.
           OPEN  INPUT EMP-FILE.
           MOVE  LK-CD        TO   EMP-CD.
           READ  EMP-FILE KEY IS   EMP-CD
             INVALID KEY
                 MOVE  1      TO   LK-RETURN
           END-READ.
           MOVE  EMP-NAME     TO   LK-NAME.
           MOVE  EMP-DPT-CD   TO   LK-DPT-CD.
           MOVE  EMP-ENT-DATE TO   LK-ENT-DATE.
           CLOSE EMP-FILE.
       MAIN-900.
           EXIT PROGRAM.
