* Encoding: UTF-8.

* 以下为纵向合并示例
* 示例：创建第 1 个数据集.
DATA LIST FREE / id (F4.0) name (A4) math (F3.0).
BEGIN DATA
1001 John  88
1002 Mary  75
1003 Paul  93
END DATA.
DATASET NAME scores_A.

* 示例：创建第 2 个数据集.
DATA LIST FREE / id (F4.0) name (A6) math (F3.0).
BEGIN DATA
1004 Anna   81
1005 Simon  79
1006 Cathy  85
END DATA.
DATASET NAME scores_B.

* 将两个数据集类型统一（确保 name 变量为 A6）.
DATASET ACTIVATE scores_A.
ALTER TYPE name (A6).
EXECUTE.

* 激活第 2 个数据集（已为 A6，无需改变）.
DATASET ACTIVATE scores_B.
* — 假定已正确为 A6。

* 进行纵向合并（添加个案）.
DATASET ACTIVATE scores_A.
ADD FILES
  /FILE = *
  /FILE = scores_B.
EXECUTE.


* 以下为横向合并示例
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

DATASET ACTIVATE main.
MATCH FILES 
    /FILE=*
    /FILE=lookup
    /BY id.
EXECUTE.
