* Encoding: UTF-8.
* 先创建原始数据集，并添加重复行以演示.
DATA LIST FREE / Name (A20) Gender (A1) Age (F2.0) Chinese (F3.0) Math (F3.0) English (F3.0).
BEGIN DATA
"张伟" "M" 15 85 90 78
"李娜" "F" 16 92 88 95
"王芳" "F" 15 78 82 89
"刘明" "M" 17 88 95 82
"陈静" "F" 16 90 85 91
"赵磊" "M" 18 76 80 77
"孙晓" "F" 15 95 92 96
"周杰" "M" 16 82 87 80
"吴敏" "F" 17 89 83 88
"郑浩" "M" 18 84 91 79
"张伟" "M" 15 85 90 78
"李娜" "F" 16 92 88 95
"张伟" "M" 15 85 90 78
END DATA.
DATASET NAME StudentDataRep.

* 添加变量标签（可选）.
VARIABLE LABELS 
  Name '学生姓名'
  Gender '性别'
  Age '年龄'
  Chinese '语文成绩'
  Math '数学成绩'
  English '英语成绩'.

* 值标签（可选）.
VALUE LABELS Gender 
  'M' '男' 
  'F' '女'.
