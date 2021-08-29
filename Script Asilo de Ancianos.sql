/*==============================================================*/
/* Table: TIPOPERSONAL                                          */
/*==============================================================*/
create table TIPOPERSONAL (
   TIPOPER_ID           INT                  not null,
   TIPOPER_MEDICO       CHAR(2)              null,
   TIPOPER_ENFERMERA    CHAR(2)              null,
   TIPOPER_ESPECIALISTA CHAR(2)              null,
   TIPOPER_SECRETARIA   CHAR(2)              null,
   constraint PK_TIPOPERSONAL primary key (TIPOPER_ID)
);
insert into TIPOPERSONAL values (1,'si');
insert into TIPOPERSONAL values (2,null,'si');
insert into TIPOPERSONAL values (3,null,null,'si');
insert into TIPOPERSONAL values (4,null,null,null,'si');

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
   PER_ID               INT                  not null,
   TIPOPER_ID           INT                  not null,
   PER_CEDULA           INT                  null,
   PER_NOMBRE           CHAR(50)             null,
   PER_APELLIDO         CHAR(50)             null,
   PER_DIRECCION        CHAR(50)             null,
   PER_TELEFONO         INT                  null,
   PER_RONDAS           CHAR(100)            null,
   PER_FECHAINGRESO     CHAR(50)             null,
   PER_FECHASALIDA      VARCHAR(50)          null,
   constraint PK_PERSONAL primary key (PER_ID)
);
insert into PERSONAL values (1,4,1313196361,'Carmen','Villafuerte','via interbarrial',0995432656,'Mañana','21/06/21 09H00','22/06/21 11H00');
insert into PERSONAL values (2,1,1313196361,'Santiago','Sanil','via interbarrial',0995432656,'Mañana','21/06/21 09H00','22/06/21 11H00');
insert into PERSONAL values (3,3,1313196361,'Josue','Cedeño','via interbarrial',0995432656,'Tarde','21/06/21 15H00','22/06/21 7H00');
insert into PERSONAL values (4,3,1313196361,'Carla','Vera','via interbarrial',0995432656,'Tarde','21/06/21 15H00','22/06/21 7H00');
insert into PERSONAL values (5,3,1313196361,'Carolina','Cevallos','via interbarrial',0995432656,'Noche','21/06/21 22H00','22/06/21 13H00');
insert into PERSONAL values (6,2,1313196361,'Angulo','Vaca','via interbarrial',0995432656,'Mañana','21/06/21 09H00','22/06/21 11H00');
insert into PERSONAL values (7,2,1313196361,'Pico','Anchundia','via interbarrial',0995432656,'Noche','21/06/21 22H00','22/06/21 13H00');

/*==============================================================*/
/* Table: PAGOPERSONAL                                          */
/*==============================================================*/
create table PAGOPERSONAL (
   PAGPER_ID            INT                     not null,
   PER_ID               INT                     not null,
   PAGPER_DESCUENTOCEDITOS CHAR(50)             null,
   PAGPER_SALARIO       CHAR(50)                null,
   PAGPER_DESCUENTOSEGURO CHAR(50)              null,
   PAGPER_FECHAPAGO     CHAR(50)                null,
   constraint PK_PAGOPERSONAL primary key (PAGPER_ID)
);
insert into PAGOPERSONAL values (1,1,'50','7000','20','30 de cada mes');
insert into PAGOPERSONAL values (2,2,'60','9000','20','30 de cada mes');
insert into PAGOPERSONAL values (3,3,'50','7000','20','30 de cada mes');
insert into PAGOPERSONAL values (4,4,'60','8000','30','30 de cada mes');
insert into PAGOPERSONAL values (5,5,'70','8000','30','30 de cada mes');
insert into PAGOPERSONAL values (6,6,'80','8000','30','30 de cada mes');
insert into PAGOPERSONAL values (7,7,'100','7000','20','30 de cada mes');

/*==============================================================*/
/* Table: SERVICIOREHABILITACION                                */
/*==============================================================*/
create table SERVICIOREHABILITACION (
   SEREAL_ID            INT                  not null,
   SEREAL_DETALLES      CHAR(50)             null,
   SEREAL_HORARIO       VARCHAR(50)          null,
   constraint PK_SERVICIOREHABILITACION primary key (SEREAL_ID)
);
insert into SERVICIOREHABILITACION values (1,'Terapia Ocupacional','09H00 a 11H00');
insert into SERVICIOREHABILITACION values (2,'Terapia Fisica','14H00 a 15H00');
insert into SERVICIOREHABILITACION values (3,'Terapia Habla','16H00 a 18H00');

/*==============================================================*/
/* Table: FICHA                                                 */
/*==============================================================*/
create table FICHA (
   FIC_ID               INT                  not null,
   SEREAL_ID            INT                  not null,
   FAC_ID               INT                  not null,
   PER_ID               INT                  not null,
   FIC_ESTADO           VARCHAR(100)         null,
   FIC_CONTACTO_EMER    CHAR(200)            null,
   FIC_ESTADIA          CHAR(50)             null,
   FIC_TIPO_LESION      CHAR(50)             null,
   FIC_FECHA_DIFUNCION  CHAR(50)             null,
   constraint PK_FICHA primary key (FIC_ID)
);
insert into FICHA values (1,1,1,1,'Estable','0995432656 - 0995432656,0995432656','Temporal','Golpe de la pierna');
insert into FICHA values (2,1,2,1,'Estable','0995432656,0995432656,0995432656','Temporal','Golpe de la brazo',null);
insert into FICHA values (3,2,3,1,'Delicado','0995432656,0995432656,0995432656','Permanente','Golpe de la cabeza','21/10/14 hora 10H00');
insert into FICHA values (4,2,4,1,'Delicado','0995432656,0995432656,0995432656','Permanente','Golpe de la pulmon','21/10/13 hora 09H00');
insert into FICHA values (5,3,5,1,'Delicado','0995432656,0995432656,0995432656','Permanente','Golpe de la corazon',null);
insert into FICHA values (6,3,6,1,'Estable','0995432656,0995432656,0995432656','Permanente','Golpe de la pierna',null);
insert into FICHA values (7,1,7,1,'Mejorando','0995432656,0995432656,0995432656','Permanente');
insert into FICHA values (8,2,8,1,'Estable','0995432656,0995432656,0995432656','Permanente');

/*==============================================================*/
/* Table: PERSONAENTIDAD                                        */
/*==============================================================*/
create table PERSONAENTIDAD (
   PER_EN_ID            INT                  not null,
   FIC_ID               INT                  not null,
   PER_EN_CD_RUM        INT                  null,
   PER_EN_NOMBRE        CHAR(50)             null,
   PER_EN_APELLIDO      CHAR(50)             null,
   PER_EN_DIRECCION     CHAR(50)             null,
   PER_EN_TELEFONO      CHAR(50)             null,
   PER_EN_GENERO        CHAR(50)             null,
   constraint PK_PERSONAENTIDAD primary key (PER_EN_ID)
);
insert into PERSONAENTIDAD values (1,1,1351127624,'Carmen','Loor','Centro Manta','0252541642','hombre');
insert into PERSONAENTIDAD values (2,2,1351127624,'Josy','Pico','Centro Manta','0252541642','hombre');
insert into PERSONAENTIDAD values (3,3,1351127624,'Macias','Anchundia','Centro Manta','0252541642','hombre');
insert into PERSONAENTIDAD values (4,4,1351127624,'Delgado','Luis','Centro Manta','0252541642','mujer');
insert into PERSONAENTIDAD values (5,5,1351127624,'Maikol','Pachai','Centro Manta','0252541642','mujer');
insert into PERSONAENTIDAD values (6,6,1351127624,'Deniis','Sanches','Centro Manta','0252541642','mujer');
insert into PERSONAENTIDAD values (7,7,1111134001,'Sara de la Paz',null,'Centro Manta','0252541642');
insert into PERSONAENTIDAD values (8,8,1111134001,'Sara de la Paz',null,'Centro Manta','0252541642');

/*==============================================================*/
/* Table: ATENCIONMEDICA                                        */
/*==============================================================*/
create table ATENCIONMEDICA (
   ATEMED_ID            INT                  not null,
   FIC_ID               INT                  not null,
   ATEMED_ENFEMERIA     CHAR(5)              null,
   ATEMED_SUPERVISION   CHAR(5)              null,
   ATEMED_AYUDAACTIVIDAD CHAR(5)              null,
   ATEMED_ENTRETENIMINETO CHAR(5)              null,
   ATEMED_HORARIO       CHAR(20)              null,
   constraint PK_ATENCIONMEDICA primary key (ATEMED_ID)
);
insert into ATENCIONMEDICA values (1,1,'si',null,null,null,'8h00 a 9h00');
insert into ATENCIONMEDICA values (2,2,'si',null,'si',null,'8h00 a 9h00');
insert into ATENCIONMEDICA values (3,3,null,'si',null,null,'10h00 a 11h00');
insert into ATENCIONMEDICA values (4,4,null,'si',null,null,'13h00 a 14h00');
insert into ATENCIONMEDICA values (5,5,null,'si','si',null,'20h00 a 21h00');
insert into ATENCIONMEDICA values (6,6,null,'si',null,'si','21h00 a 22h00');
insert into ATENCIONMEDICA values (7,7,null,'si',null,'si','01h00 a 02h00');
insert into ATENCIONMEDICA values (8,8,null,'si',null,'si','01h00 a 02h00');

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   PA_ID                INT                  not null,
   FIC_ID               INT                  not null,
   PA_CEDULA2           INT                  null,
   PA_NOMBRE            CHAR(50)             null,
   PA_APELLIDO          CHAR(50)             null,
   PA_GENERO            CHAR(10)             null,
   PA_FECHANACIMIENTO   CHAR(50)             null,
   PA_PARENTESCO        CHAR(50)             null,
   constraint PK_PACIENTE primary key (PA_ID)
);
insert into PACIENTE values (1,1,135112764,'Jair','Lirio','hombre','8/10/1972','hermano');
insert into PACIENTE values (2,2,135112724,'Elizabeth','Lirio','mujer','8/10/1964','hermano');
insert into PACIENTE values (3,3,135112624,'Milton','Parrales','hombre','8/10/1984','primo');
insert into PACIENTE values (4,4,135117624,'Nelson','Parrales','hombre','8/10/1972','primo');
insert into PACIENTE values (5,5,137527624,'Anabel','Basurto','mujer','8/10/1973','hermano');
insert into PACIENTE values (6,6,13127624,'Patricio','Basurto','hombre','8/10/1973','hermana');
insert into PACIENTE values (7,7,151127624,'Jorge','Quijije','hombre','8/10/1974','hermano');
insert into PACIENTE values (8,8,351127624,'Juan Arlos','Villarmar','hombre','8/10/1974','hermana');

/*==============================================================*/
/* Table: ALIMENESTABLECIDA                                     */
/*==============================================================*/
create table ALIMENESTABLECIDA (
   ALIMEN_ID            INT                  not null,
   PA_ID                INT                  not null,
   PER_ID               INT                  not null,
   constraint PK_ALIMENESTABLECIDA primary key (ALIMEN_ID)
);
insert into ALIMENESTABLECIDA  values (1,1,7);
insert into ALIMENESTABLECIDA  values (2,2,6);	
insert into ALIMENESTABLECIDA  values (3,3,3);
insert into ALIMENESTABLECIDA  values (4,4,3);
insert into ALIMENESTABLECIDA  values (5,5,4);
insert into ALIMENESTABLECIDA  values (6,6,4);
insert into ALIMENESTABLECIDA  values (7,7,5);
insert into ALIMENESTABLECIDA  values (8,8,5);

/*==============================================================*/
/* Table: ALIMENTACION                                          */
/*==============================================================*/
create table ALIMENTACION (
   ALIME_ID             INT                  not null,
   FIC_ID               INT                  null,
   ALIMEN_ID            INT                  not null,
   ALIME_DETALLE        CHAR(100)            null,
   ALIME_TIEMPO         CHAR(50)             null,
   constraint PK_ALIMENTACION primary key (ALIME_ID)
);
insert into ALIMENTACION values (1,1,1,'Dieta de progresión','1 mes');
insert into ALIMENTACION values (2,2,2,'Dieta con modificación de la ingesta proteica','1 mes');
insert into ALIMENTACION values (3,3,3,'Dieta con restricción glucémica','hermano');
insert into ALIMENTACION values (4,4,4,'Dieta con modificación de la ingesta proteica','4 semanas');
insert into ALIMENTACION values (5,5,5,'Dietas con modificación de lípidos','4 semanas');
insert into ALIMENTACION values (6,6,6,'Dietas con modificación de fibra','3 mes');
insert into ALIMENTACION values (7,7,7,'Dieta con modificación de la ingesta proteica','3 mes');
insert into ALIMENTACION values (8,8,8,'Dieta de progresión','1 mes');

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   FAC_ID               INT                  not null,
   FAC_DEUDA            INT                  null,
   FAC_SUBTOTAL         INT                  null,
   FAC_TOTAL            INT                  null,
   constraint PK_FACTURA primary key (FAC_ID)
);
insert into FACTURA values (1,null,10000,10000);
insert into FACTURA values (2,null,10000,10000);
insert into FACTURA values (3,null,10000,10000);
insert into FACTURA values (4,null,10000,10000);
insert into FACTURA values (5,null,10000,10000);
insert into FACTURA values (6,null,10000,10000);
insert into FACTURA values (7,null,10000,10000);
insert into FACTURA values (8,null,10000,10000);

insert into FACTURA values (9,null,1000,10000);
insert into FACTURA values (10,null,1000,10000);
insert into FACTURA values (11,null,1000,10000);
insert into FACTURA values (12,null,1000,10000);
insert into FACTURA values (13,null,1000,10000);
insert into FACTURA values (14,null,1000,10000);
insert into FACTURA values (15,null,1000,10000);


/*==============================================================*/
/* Table: TIPOPAGO                                              */
/*==============================================================*/
create table TIPOPAGO (
   PAG_ID               INT                  not null,
   PAG_TIPO_PAGO        CHAR(50)             null,
   constraint PK_TIPOPAGO primary key (PAG_ID)
);

insert into TIPOPAGO values (1,'tarjeta');
insert into TIPOPAGO values (2,'cheque');
insert into TIPOPAGO values (3,'deposito');

/*==============================================================*/
/* Table: DETFACTURA                                            */
/*==============================================================*/
create table DETFACTURA (
   DETFAC_ID            INT                  not null,
   FAC_ID               INT                  not null,
   PAG_ID               INT                  not null,
   PAGPER_ID            INT                  null,
   constraint PK_DETFACTURA primary key (DETFAC_ID)
);

insert into DETFACTURA values (1,1,1);
insert into DETFACTURA values (2,2,1);
insert into DETFACTURA values (3,3,2);
insert into DETFACTURA values (4,4,2);
insert into DETFACTURA values (5,5,3);
insert into DETFACTURA values (6,6,3);
insert into DETFACTURA values (7,7,1);
insert into DETFACTURA values (8,8,2);

insert into DETFACTURA values (9,9,3,1);
insert into DETFACTURA values (10,10,3,2);
insert into DETFACTURA values (11,11,3,3);
insert into DETFACTURA values (12,12,2,4);
insert into DETFACTURA values (13,13,1,5);
insert into DETFACTURA values (14,14,1,6);
insert into DETFACTURA values (15,15,2,7);

/*=======================================================================================================*/
alter table ALIMENESTABLECIDA
   add constraint FK_ALIMENES_RELATIONS_PERSONAL foreign key (PER_ID)
      references PERSONAL (PER_ID)
      on delete restrict on update restrict;

alter table ALIMENESTABLECIDA
   add constraint FK_ALIMENES_RELATIONS_PACIENTE foreign key (PA_ID)
      references PACIENTE (PA_ID)
      on delete restrict on update restrict;

alter table ALIMENTACION
   add constraint FK_ALIMENTA_RELATIONS_FICHA foreign key (FIC_ID)
      references FICHA (FIC_ID)
      on delete restrict on update restrict;

alter table ALIMENTACION
   add constraint FK_ALIMENTA_RELATIONS_ALIMENES foreign key (ALIMEN_ID)
      references ALIMENESTABLECIDA (ALIMEN_ID)
      on delete restrict on update restrict;

alter table ATENCIONMEDICA
   add constraint FK_ATENCION_RELATIONS_FICHA foreign key (FIC_ID)
      references FICHA (FIC_ID)
      on delete restrict on update restrict;

alter table DETFACTURA
   add constraint FK_DETFACTU_RELATIONS_FACTURA foreign key (FAC_ID)
      references FACTURA (FAC_ID)
      on delete restrict on update restrict;

alter table DETFACTURA
   add constraint FK_DETFACTU_RELATIONS_TIPOPAGO foreign key (PAG_ID)
      references TIPOPAGO (PAG_ID)
      on delete restrict on update restrict;

alter table DETFACTURA
   add constraint FK_DETFACTU_RELATIONS_PAGOPERS foreign key (PAGPER_ID)
      references PAGOPERSONAL (PAGPER_ID)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_PERSONAL foreign key (PER_ID)
      references PERSONAL (PER_ID)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_SERVICIO foreign key (SEREAL_ID)
      references SERVICIOREHABILITACION (SEREAL_ID)
      on delete restrict on update restrict;

alter table FICHA
   add constraint FK_FICHA_RELATIONS_FACTURA foreign key (FAC_ID)
      references FACTURA (FAC_ID)
      on delete restrict on update restrict;

alter table PACIENTE
   add constraint FK_PACIENTE_RELATIONS_FICHA foreign key (FIC_ID)
      references FICHA (FIC_ID)
      on delete restrict on update restrict;

alter table PAGOPERSONAL
   add constraint FK_PAGOPERS_RELATIONS_PERSONAL foreign key (PER_ID)
      references PERSONAL (PER_ID)
      on delete restrict on update restrict;

alter table PERSONAENTIDAD
   add constraint FK_PERSONAE_RELATIONS_FICHA foreign key (FIC_ID)
      references FICHA (FIC_ID)
      on delete restrict on update restrict;

alter table PERSONAL
   add constraint FK_PERSONAL_RELATIONS_TIPOPERS foreign key (TIPOPER_ID)
      references TIPOPERSONAL (TIPOPER_ID)
      on delete restrict on update restrict;
