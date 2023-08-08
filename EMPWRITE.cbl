       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPWRITE.
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

       PROCEDURE DIVISION.
       MAIN-CONTROL SECTION.
       MAIN-000.
           DISPLAY "*** Creating Employee file ***".
           OPEN  OUTPUT EMP-FILE.
      *
           MOVE  "0011"            TO   EMP-CD.
           MOVE  "Saitama Saburo"  TO   EMP-NAME.
           MOVE  "01"              TO   EMP-DPT-CD.
           MOVE  20020401          TO   EMP-ENT-DATE.
           WRITE EMP-REC.
      *                        ----+----+----+----+----+----+----+
           WRITE EMP-REC FROM "0012Chiba Jiro          0219990401".
           WRITE EMP-REC FROM "0013Tokyo Taro          0319970401".
           WRITE EMP-REC FROM "0014Kanagawa Shiro      0120120401".
           WRITE EMP-REC FROM "0015Niigata  Goroo      0220010401".
      *                        ----+----+----+----+----+----+----+
           CLOSE EMP-FILE.
       MAIN-900.
           STOP RUN.
