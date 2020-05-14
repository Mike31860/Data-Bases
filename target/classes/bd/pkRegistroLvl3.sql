create or replace PACKAGE pkRegistroLvl3 is

    procedure pRegistrarSCreacion (observacion VARCHAR2 , clientes_cedula NUMBER, tipoProducto  VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2);
    procedure pRegistrarSModificacion (clientes_cedula NUMBER , clientesxproductos_id VARCHAR2, tipoProducto  VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2);
    procedure pRegistrarSCancelacion (observacion VARCHAR2, clientes_cedula NUMBER , clientesxproductos_id VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2);
    procedure pRegistrarSDanio (observacion VARCHAR2, tipoanomalia VARCHAR2, clientes_cedula NUMBER, clientesxproductos_id VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2);
    procedure pRegistrarSReclamo (observacion VARCHAR2 , clientes_cedula NUMBER, clientesxproductos_id VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2);
 
    end pkRegistroLvl3;
/
create or replace PACKAGE body pkRegistroLvl3 is
    
       --creacion
     procedure pRegistrarSCreacion (observacion VARCHAR2 , clientes_cedula NUMBER, tipoProducto  VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2) is
     begin
     pkRegistro.pRegistrarSCreacion(observacion, clientes_cedula, tipoProducto);
     code := 0;
     msj := 'Solicitud de creación realizada con éxito';
 
     exception WHEN others then
     code:=SQLCODE;
     msj:=SQLERRM;
     end;
     
      --Modificacion
     procedure pRegistrarSModificacion (clientes_cedula NUMBER , clientesxproductos_id VARCHAR2, tipoProducto  VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2) is   
     begin
     pkRegistro.pRegistrarSModificacion(clientes_cedula, clientesxproductos_id, tipoProducto);
     code := 0;
     msj := 'Solicitud de modificacion creada con éxito';
 
     exception WHEN others then
     code:=SQLCODE;
     msj:=SQLERRM;
     end;
     
      --cancelacion 
     procedure pRegistrarSCancelacion (observacion VARCHAR2, clientes_cedula NUMBER , clientesxproductos_id VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2) is
     begin
     pkRegistro.pRegistrarSCancelacion(observacion, clientes_cedula, clientesxproductos_id);
     code := 0;
     msj := 'Solicitud de cancelación creada con éxito';
 
     exception WHEN others then
     code:=SQLCODE;
     msj:=SQLERRM;
     end;
     
     --Daño
     procedure pRegistrarSDanio (observacion VARCHAR2, tipoanomalia VARCHAR2, clientes_cedula NUMBER, clientesxproductos_id VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2) is
     begin
     pkRegistro.pRegistrarSDanio(observacion, tipoanomalia, clientes_cedula, clientesxproductos_id);
     code := 0;
     msj := 'Solicitud de daño creada con éxito';
 
     exception WHEN others then
     code:=SQLCODE;
     msj:=SQLERRM;
     end;
     
      --Reclamo
     procedure pRegistrarSReclamo (observacion VARCHAR2 , clientes_cedula NUMBER, clientesxproductos_id VARCHAR2, code OUT NUMBER, msj OUT VARCHAR2) is
     begin
     pkRegistro.pRegistrarSReclamo(observacion, clientes_cedula, clientesxproductos_id);
     
     code := 0;
     msj := 'Reclamo creado con éxito';
 
     exception WHEN others then
     code:=SQLCODE;
     msj:=SQLERRM;
     end;
     
     
     end pkRegistroLvl3;