create or replace PACKAGE pkRegistro is

    procedure pRegistrarSCreacion (observacion VARCHAR2 , clientes_cedula NUMBER, tipoProducto  VARCHAR2);
    procedure pRegistrarSModificacion (clientes_cedula NUMBER , clientesxproductos_id VARCHAR2, tipoProducto  VARCHAR2);
    procedure pRegistrarSCancelacion (observacion VARCHAR2, clientes_cedula NUMBER , clientesxproductos_id VARCHAR2);
    procedure pRegistrarSDanio (observacion VARCHAR2, tipoanomalia VARCHAR2, clientes_cedula NUMBER, clientesxproductos_id VARCHAR2);
    procedure pRegistrarSReclamo (observacion VARCHAR2 , clientes_cedula NUMBER, clientesxproductos_id VARCHAR2);
 
    end pkRegistro;
/
create or replace PACKAGE body pkRegistro is
    
       --creacion
     procedure pRegistrarSCreacion (observacion VARCHAR2 , clientes_cedula NUMBER, tipoProducto  VARCHAR2) is
     codigo NUMBER;
     begin
     codigo := pkSolicitud.fCont(NULL);
     
     pkSolicitud.pInsert(codigo, observacion, null, 'Pendiente', clientes_cedula, 00, '01',null, null, '00', tipoproducto);
     exception WHEN others then
     raise_application_error(SQLCODE,SQLERRM);
     end;
     
    
     
     --Modificacion
     procedure pRegistrarSModificacion (clientes_cedula NUMBER , clientesxproductos_id VARCHAR2, tipoProducto  VARCHAR2) is   
     codigo NUMBER;
     
     begin
     codigo := pkSolicitud.fCont(NULL);
     pkSolicitud.pInsert(codigo, null, null, 'Pendiente', clientes_cedula, 00, '02',null, null, clientesxproductos_id, tipoproducto);
     exception WHEN others then
     raise_application_error(SQLCODE,SQLERRM);
     end;

     --cancelacion 
     procedure pRegistrarSCancelacion (observacion VARCHAR2, clientes_cedula NUMBER , clientesxproductos_id VARCHAR2) is
     codigo NUMBER;
     
     begin
     codigo := pkSolicitud.fCont(NULL);
     pkSolicitud.pInsert(codigo, observacion, null, 'Pendiente', clientes_cedula, 00, '03',null, null, clientesxproductos_id, null);
     exception WHEN others then
     raise_application_error(SQLCODE,SQLERRM);
     end;
     
     --Daño
     procedure pRegistrarSDanio (observacion VARCHAR2, tipoanomalia VARCHAR2, clientes_cedula NUMBER, clientesxproductos_id VARCHAR2) is
     codigo NUMBER;
     
     begin
     codigo := pkSolicitud.fCont(NULL);
     pkSolicitud.pInsert(codigo, observacion, tipoanomalia, 'Pendiente', clientes_cedula, 00, '04',null, null, clientesxproductos_id, null);
     exception WHEN others then
     raise_application_error(SQLCODE,SQLERRM);
     end;
     
     --Reclamo
     procedure pRegistrarSReclamo (observacion VARCHAR2 , clientes_cedula NUMBER, clientesxproductos_id VARCHAR2) is
     codigo NUMBER;
     
     begin
     codigo := pkSolicitud.fCont(NULL);
     pkSolicitud.pInsert(codigo, observacion, null, 'Pendiente', clientes_cedula, 00, '05',null, null, clientesxproductos_id, null);
     exception WHEN others then
     raise_application_error(SQLCODE,SQLERRM);
     end;
     
    end pkRegistro;
/
-- exec pkRegistro.pRegistrarSCreacion('00', 'prueba', 00, 'Integrado');
--exec pkRegistro.pRegistrarSModificacion('01',00,'00','Voz');