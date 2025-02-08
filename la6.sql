set server on
declare
acc_no bank.acno%type:=&accno;
balance  bank.bal%type;
amount bank.bal%type:=&amount;
begin
select bal into balance from bank where acno = acc_no;
if balance-amount>100 then
if (amount>100 and amount<20000) then
 update bank set bal=balance-amount where acno=acc_no;
else
dbms_output.put_line('amount must be >100 and <20000');
end if;
else
dbms_output.put_line('no sufficient balance');
end if;
exception
when no_data_found then
dbms_output.put_line('no such account found');
end;
/