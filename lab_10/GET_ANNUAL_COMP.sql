CREATE OR REPLACE
FUNCTION GET_ANNUAL_COMP
( p_sal IN NUMBER DEFAULT 0
, p_commision_pct IN NUMBER DEFAULT 0
) RETURN NUMBER AS
annual_sal NUMBER := 0;
v_sal NUMBER := 0;
v_commision NUMBER := 0;
BEGIN
  IF p_sal IS NULL THEN
    v_sal := 0;
  ELSE 
    v_sal := p_sal;
  END IF;
  
  IF p_commision_pct IS NULL THEN
    v_commision := 0;
  ELSE  
    v_commision := p_commision_pct;
  END IF;
  
  annual_sal := (v_sal*12) + v_commision* v_sal*12;
  RETURN annual_sal;
END GET_ANNUAL_COMP;