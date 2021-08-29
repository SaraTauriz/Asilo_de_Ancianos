--Trigger que impida sobrepasar un máximo de gasto de 80 dolares por días en las dietas establecidas.

CREATE OR REPLACE FUNCTION pagoMaximo() RETURNS TRIGGER
AS
$pagoMaximo$
  DECLARE
    pago int;
    maximo int = 80;
BEGIN
    select FAC_SUBTOTAL into pago from FACTURA ;
    if ( maximo < pago ) then
      RAISE EXCEPTION 'No se permite mas de $80 de dieta por día';
    END if;
    RETURN new;
END;
$pagoMaximo$
LANGUAGE plpgsql;


--before after instead of
create trigger pagoMaximo before insert
on FACTURA fOR EACH ROW
execute procedure pagoMaximo();


--INSERTAR DATOS VERIFICAR TRIGGER
insert into FACTURA values (17,null,100,10000);