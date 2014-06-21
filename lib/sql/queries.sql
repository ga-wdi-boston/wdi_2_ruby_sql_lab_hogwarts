-- WDI SQL/Ruby Lab
-- Blair Caple
-- June 20, 2014

--
-- Get all current students (i.e. not alumni) sorted alphabetically.
--
SELECT s.name FROM students s WHERE s.alumni_status = false ORDER BY s.name;

--
-- For a given student, find all spell categories they know spells in.
--
SELECT st.name, sp.category
  FROM students st
  JOIN known_spells ks ON ks.student_id = st.id
  JOIN spells sp ON ks.spell_id = sp.id
  GROUP BY st.name, sp.category
  ORDER BY st.name, sp.category;
