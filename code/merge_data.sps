* Encoding: UTF-8.

* 示例数据集：主表和查找表.
DATA LIST FREE / id (F4.0) score_math (F3.0).
BEGIN DATA
101  85
102  78
103  92
104  69
105  88
END DATA.
DATASET NAME main.

DATA LIST FREE / id (F4.0) school (A50) region (A10).
BEGIN DATA
101 "Greenwood High School"    "North"
102 "Riverside Preparatory Academy" "West"
103 "Pine Valley School"       "East"
105 "Cedar Ridge Collegiate"   "North"
END DATA.
DATASET NAME lookup.
