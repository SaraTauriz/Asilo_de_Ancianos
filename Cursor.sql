--Cursor que muestre el número de dietas establecidas por el profecional especializado "Pico"
do $$
DECLARE
    sum decimal = 0;
    can decimal;
    recorrer record;
    -- Declaración EXPLICITA del cursor
    profesional CURSOR FOR SELECT * FROM personal, paciente, alimenestablecida, ficha,alimentacion,factura
    where 
	personal.per_id = alimenestablecida.per_id AND 
	alimenestablecida.pa_id = paciente.pa_id AND
        alimenestablecida.alimen_id = alimentacion.alime_id AND 
        ficha.fac_id = factura.fac_id AND
	personal.per_nombre = 'Pico';
BEGIN
   -- Procesa el cursor
   FOR can IN profesional
   LOOP
	sum = sum + count(can.per_id);
   END LOOP;
   open profesional;
   fetch profesional into recorrer;
   raise notice 'Nombre: %Cantidad: %',  recorrer.per_nombre, sum; 
END $$ 
LANGUAGE 'plpgsql'