# 支持 obj:-fun 调用的，且在老版本能够使用的面向对象实现方法。
MyStringOld:=module()
    option package;
    global `type/mystring`;
    export `+`,mystring;
    # 注册类型需要使用 global 变量
    `type/mystring`:=`module`(str,append);
    # 重载操作符测试
    `+`:=proc(x::seq(mystring))
        option overload;# 必须要有该选项才不会干扰默认操作符
        return mystring(cat(map(y->y:-str,[x])[]));
    end proc:
    # 对象构造器
    mystring:=proc(s::string)
        # 采用普通module才能愉快的访问内部变量。
        module()
            export str:=s,append;
            local ModulePrint;
            append:=proc(s::{string,mystring})
                if type(s,string) then
                    str:=cat(str,s);
                else
                    str:=cat(str,s:-str);
                end if;
                return thismodule;
            end proc:
            ModulePrint:=proc()
                return 'mystring'(str);
            end proc:
        end module:
    end proc:
end module: