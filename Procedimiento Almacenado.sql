--Procedimiento almacenado que reciba un parámetro de entrada (doctor) y que 
--muestre todos los pacientes que este tenga a su cargo.

create or replace function pacientes(variable varchar)returns character
as
$$
Select 
  pa_nombre 
from 
  paciente,
  personal,
  alimenestablecida
WHERE
  personal.per_id = alimenestablecida.per_id and
  alimenestablecida.pa_id = paciente.pa_id and
  per_nombre = variable
$$
language SQL;


--Insert de consulta
select pacientes('Carolina');