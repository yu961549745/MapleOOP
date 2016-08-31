# 单独实现
restart;
Foo:=module()
	option object;
	export `{}`::static,key::static,v;
	local ModuleApply::static,ModulePrint::static;
	ModuleApply:=proc(x)
		local z;
		z:=Object(Foo);
		z:-v:=x;
		return z;
	end proc:
	ModulePrint:=proc(x)
		return 'Foo'(x:-v);
	end proc:
	key:=proc(x)
		return x:-v;
	end proc:
	`{}`:=proc()
		local t,v,x;
		# 该唯一化方法可以推广
		t:=table();
		for v in _passed do
			if type(v,Foo) then
				t[key(v)]:=v;
			else
				t[addressof(v)]:=v;
			end if;
		end do;
		return :-`{}`(entries(t,nolist));
	end proc:
end module:
getX:=proc()
	local x;
	return x;
end proc:
# 奇怪，如果写在表达式里就是同一个对象
x:=Foo(1);
y:=Foo(1);
# 由此可见默认的set不支持对象的比较
numelems({x,y});
numelems(:-`{}`(x,y));
# 当参数中含有对象时，会调用该对象的重载方法
{1,2,3};
{1,2,x,y};