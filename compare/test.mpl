# 老版本的面向对象
restart;
read("MyStringOld.mpl");
with(MyStringOld);# 必须要with才能方便的使用
# 初始化
a:=mystring("1");
b:=mystring("2");
# 操作符重载测试
a+b+mystring("3");
1+2;
"1"+"2";
# obj:-fun调用方式测试
a:-append("233");
b:-append(a);

# 新版本面向对象
restart;
read("MyString.mpl");
# 无需with
# 初始化
a:=MyString("1");
b:=MyString("2");
# 操作符重载测试
a+b+MyString("3");
1+2;
"1"+"2";
# obj:-fun调用方式测试
append(a,"233");
append(b,a);