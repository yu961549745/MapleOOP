# option/object的面向对象
module MyString()# Named module 防止该类型被覆盖
    option object;
    local ModulePrint::static,ModuleApply::static;
    export str:="",`+`::static,append::static;# 函数可以使用static关键字共享内存，但是写起来麻烦
    `+`:=proc(x::seq(MyString))# 自带类型支持，无需另外注册
        # 可以不写overload选项
        return MyString(cat(map(y->y:-str,[x])[]));
    end proc:
    ModulePrint:=proc(x)# 函数调用必须带着对象
        return 'MyString'(x:-str);
    end proc:
    ModuleApply:=proc(s::string)
        local x;
        x:=Object(MyString);# 能够被复制
        x:-str:=s;
        return x;
    end proc:
    append:=proc(x,_s::{string,MyString})
        local s;
        s:=`if`(type(_s,string),_s,_s:-str);
        x:-str:=cat(x:-str,s);
        return x;
    end proc:
end module: