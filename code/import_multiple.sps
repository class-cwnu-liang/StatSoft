* Encoding: UTF-8.
CD 'C:\Users\liang\OneDrive\Documents\Lecture\2025秋季学期\统计软件包'.
GET DATA 
  /TYPE=XLSX 
  /FILE='样例数据\Students\student_scores.xlsx' 
  /SHEET=INDEX 1
  /CELLRANGE=FULL 
  /READNAMES=ON.
DATASET NAME scores_1. 
EXECUTE. 

GET DATA 
  /TYPE=XLSX 
  /FILE='样例数据\Students\student_scores.xlsx' 
  /SHEET=INDEX 2
  /CELLRANGE=FULL 
  /READNAMES=ON.
DATASET NAME scores_2. 
EXECUTE. 

DATASET ACTIVATE scores_2.
ALTER TYPE Gender (A6).
ADD FILES /FILE=*
    /FILE=scores_1.
DATASET NAME scores WINDOW=FRONT.
DATASET CLOSE scores_1.
EXECUTE.

SAVE OUTFILE='样例数据\Students\student_scores.sav'.
