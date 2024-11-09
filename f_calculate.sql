create or replace function calculate(num_1 number, math_operator varchar, num_2 number) return varchar2
	as
	l_num_1 number := num_1;
	l_math_operator varchar2(32676) := math_operator;
	l_num_2 number := num_2;
	l_result varchar2(32676) default  null; 
	e_no_operator exception;
	e_any_other_operator exception;
begin
	case 
		 when l_math_operator ='+' then
			l_result := to_char(l_num_1 + l_num_2);

		when l_math_operator = '-' then
			l_result := to_char(l_num_1 - l_num_2);

		when l_math_operator = '*' then
			l_result := to_char(l_num_1*l_num_2);

		when l_math_operator = '/' then
			l_result := to_char(l_num_1/l_num_2);

		when l_math_operator is null then
			raise e_no_operator;

		else
			raise e_any_other_operator;	

	end case;		
return 	l_result;	
exception
		when e_no_operator then
			raise_application_error(-20001,'you have not entered any operator! please enter any valid operator (+, -, *, /).');

		when others then
			raise_application_error(-20002,'you have entered an invalid operator! please enter any valid operator (+, -, *, /).');	

end;
