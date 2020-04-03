SET SERVEROUTPUT ON;
DECLARE 
  v_countryid VARCHAR2(20) := 'CA';
  v_country_record countries%ROWTYPE;
BEGIN
  SELECT * INTO v_country_record FROM countries WHERE country_id = v_countryid;
  
  dbms_output.put_line('Country_id: ' || v_country_record.country_id);
  dbms_output.put_line('Country_name: ' || v_country_record.country_name);
  dbms_output.put_line('Region: ' || v_country_record.region_id);
  
END;
/