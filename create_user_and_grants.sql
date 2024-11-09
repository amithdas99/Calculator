/*Create calculator Schema*/
create user calculator_dev identified by calculator123;

/*Grant basic grants to the schema*/
grant create session,select any table, resource, select, insert to calculator_dev;

