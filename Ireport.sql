--Ireport. Cuál es al cantidad de ancianos de acuerdo a su edad, 
--establecidos en el asilo Sara de la Paz

SELECT 
  count(paciente.pa_id), 
  substring (paciente.pa_fechanacimiento from 6 for 8)
FROM 
  public.paciente
  group by (paciente.pa_fechanacimiento)