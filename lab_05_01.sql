BEGIN 
  FOR i IN 1..10 LOOP
    IF i IN (6,8)
    THEN 
      CONTINUE;
    END IF;
    
    INSERT INTO messages(RESULTS) VALUES (TO_CHAR(i));  
  END LOOP;
END;
/