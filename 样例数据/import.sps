* Encoding: UTF-8.
CD 'C:\Users\liang\OneDrive\Documents\Lecture\2025秋季学期\统计软件包'.
GET DATA /TYPE=XLSX
    /FILE='样例数据\Students\student_scores.xlsx'
    /CELLRANGE=FULL
    /READNAMES=ON.
EXECUTE.
DATASET NAME StudentScores WINDOW=FRONT.
RECODE ParentEduc
    ('some high school' = 1)
    ('high school' = 2)
    ('some college' = 3)
    ('associate''s degree' = 4)
    ('bachelor''s degree' = 5)
    ('master''s degree' = 6)
    INTO ParentEducOrd.
VALUE LABELS ParentEducOrd
    1 'some high school'
    2 'high school'
    3 'some college'
    4 'associate''s degree'
    5 'bachelor''s degree'
    6 'master''s degree'.
ALTER TYPE ParentEducOrd (F1.0).
VARIABLE LEVEL ParentEducOrd (ORDINAL).
EXECUTE.
SAVE OUTFILE='样例数据\Students\StudentScores.sav'.
SAVE TRANSLATE 
    /OUTFILE="样例数据\Students\StudentScores.csv"
    /TYPE=CSV
    /REPLACE
    /FIELDNAMES.
