
DECLARE
	R NUMBER(2);
	T TIMESTAMP;
	mensagem VARCHAR2(50);
	status_envio VARCHAR2(100);
BEGIN
	FOR i IN 1..1000 LOOP
		T := systimestamp;
		
		select to_char(T, 'yyyy-mm-dd hh24:mi:ss.ff3') into mensagem from dual;
		
		SELECT 
			   amqp_publish(
			   		1
			   		, 'oracle'
			   		, 'valor'
			   		, 'nro ' || to_char(i, '9999') || ' ' || mensagem
			   )
		INTO   R
		FROM   dual;
		
		select decode(R, 0, 'enviada', 'nao enviada') into status_envio from dual;
		
		dbms_output.put_line('Mensagem nro ' || i || ' ' || mensagem || ' ' || status_envio);
	END LOOP;
END;
/
