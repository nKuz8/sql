BEGIN
  ADD_JOB('IT_DBA', 'Database Administrator');
  ADD_JOB('ST_MAN', 'Stock Manager');
--  Ошибка нарушения уникальности, так как такая должность уже существует в табице
END;
/