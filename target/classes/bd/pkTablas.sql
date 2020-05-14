Create or replace PACKAGE pkClientes is
    TYPE clien IS RECORD(nombre clientes.nombre%TYPE, cedula clientes.cedula%TYPE, fechanacimiento clientes.fechanacimiento%TYPE, telefono clientes.telefono%TYPE, direccion clientes.direccion%TYPE );
    procedure pInsert (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2);
    procedure pDelete (cedula NUMBER);
    procedure pUpdate (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2);
    function fConsult (cedula NUMBER) return clien;
    
    end pkClientes;
/  

Create or replace PACKAGE body pkClientes is

     procedure pInsert (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2) is
     begin
     INSERT INTO Clientes values(nombre, cedula, fechanacimiento, telefono, direccion);
     exception WHEN others then
     raise_application_error(-20001,'Error al insertar en la tabla Clientes' || SQLERRM);
     end;
    
    procedure pDelete (cedula NUMBER) is
    begin
    DELETE FROM Clientes where Clientes.cedula = cedula;
     exception WHEN others then
     raise_application_error(-20001,'Error al borrar en la tabla Clientes' || SQLERRM);
    end;
    
    procedure pUpdate (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2) is
    begin
    UPDATE Clientes 
    SET Clientes.nombre = nombre, Clientes.cedula = cedula, Clientes.fechanacimiento = fechanacimiento, Clientes.telefono=telefono, Clientes.direccion=direccion
    where Clientes.cedula = cedula;
    exception WHEN others then
     raise_application_error(-20001,'Error al modificar en la tabla Clientes' || SQLERRM);
    end;
    
    function fConsult (cedula NUMBER) return clien is
    cli clien;
    begin
    SELECT *
    INTO cli
    FROM Clientes
    WHERE Clientes.cedula = cedula;
    return cli;
    exception WHEN others then
     raise_application_error(-20001,'Error al consultar en la tabla Clientes' || SQLERRM);
    end;
    
    end pkClientes;
    
/   
Create or replace PACKAGE pkTipoSolicitud is
    TYPE ts IS RECORD(codigo tiposolicitud.codigo%TYPE, descripcion tiposolicitud.descripcion%TYPE);
    procedure pInsert (codigo VARCHAR2, descripcion VARCHAR2);
    procedure pDelete (codigo VARCHAR2);
    procedure pUpdate (codigo VARCHAR2, descripcion VARCHAR2);
    function fConsult (codigo VARCHAR2) return ts;
    
    end pkTipoSolicitud;
/    
Create or replace PACKAGE body pkTipoSolicitud is

     procedure pInsert (codigo VARCHAR2, descripcion VARCHAR2) is
     begin
     INSERT INTO tiposolicitud values(codigo, descripcion);
      exception WHEN others then
     raise_application_error(-20001,'Error al insertar en la tabla TipoSolicitud' || SQLERRM);
     end;
    
    procedure pDelete (codigo VARCHAR2) is
    begin
    DELETE FROM tiposolicitud where tiposolicitud.codigo = codigo;
    exception WHEN others then
     raise_application_error(-20001,'Error al borrar en la tabla TipoSolicitud' || SQLERRM);
    end;
    
    
     procedure pUpdate (codigo VARCHAR2, descripcion VARCHAR2) is
    begin
    UPDATE tiposolicitud
    SET tiposolicitud.codigo=codigo,tiposolicitud.descripcion=descripcion
    where tiposolicitud.codigo = codigo;
    exception WHEN others then
     raise_application_error(-20001,'Error al modificar en la tabla TipoSolicitud' || SQLERRM);
    end;
    
    function fConsult (codigo VARCHAR2) return ts is
    soli ts;
    begin
    SELECT *
    INTO soli
    FROM tiposolicitud
    WHERE tiposolicitud.codigo = codigo;
    return soli;
    exception WHEN others then
     raise_application_error(-20001,'Error al consultar en la tabla TipoSolicitud' || SQLERRM);
    end;
       
    end pkTipoSolicitud; 
    
/    
Create or replace PACKAGE pkProducto is
    
    TYPE pd IS RECORD(codigo producto.codigo%TYPE, descripcion producto.descripcion%TYPE);
    procedure pInsert (codigo VARCHAR2, descripcion VARCHAR2);
    procedure pDelete (codigo VARCHAR2);
    procedure pUpdate (codigo VARCHAR2, descripcion VARCHAR2);
    function fConsult (codigo VARCHAR2) return pd;
    
    end pkProducto;
/    
Create or replace PACKAGE body pkProducto is

     procedure pInsert (codigo VARCHAR2, descripcion VARCHAR2) is
     begin
     INSERT INTO producto values(codigo, descripcion);
      exception WHEN others then
     raise_application_error(-20001,'Error al insertar en la tabla Producto' || SQLERRM);
     end;
    
    procedure pDelete (codigo VARCHAR2) is
    begin
    DELETE FROM producto where producto.codigo = codigo;
    exception WHEN others then
    raise_application_error(-20001,'Error al borrar en la tabla Producto' || SQLERRM);
    end;
    
    
    procedure pUpdate (codigo VARCHAR2, descripcion VARCHAR2) is
     begin
    UPDATE Producto
    SET Producto.codigo=codigo,Producto.descripcion=descripcion
    where Producto.codigo=codigo;
    exception WHEN others then
    raise_application_error(-20001,'Error al modificar en la tabla Producto' || SQLERRM);
    end;
    
    
    function fConsult (codigo VARCHAR2) return pd is
    pro pd;
    begin
    SELECT *
    INTO pro
    FROM producto
    WHERE producto.codigo = codigo;
    return pro;
    exception WHEN others then
    raise_application_error(-20001,'Error al consultar en la tabla Producto' || SQLERRM);
    end;
    
    end pkProducto; 
    
/    
Create or replace PACKAGE pkFuncionario is

    TYPE fn IS RECORD(nombre funcionario.nombre%TYPE, cedula funcionario.cedula%TYPE, fechanacimiento funcionario.fechanacimiento%TYPE, telefono funcionario.telefono%TYPE, direccion funcionario.direccion%TYPE );
    procedure pInsert (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2);
    procedure pDelete (cedula NUMBER);
    procedure pUpdate (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2);
    function fConsult (cedula NUMBER) return fn;
    
    end pkFuncionario;
/    
Create or replace PACKAGE body pkFuncionario is

     procedure pInsert (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2) is
     begin
     INSERT INTO funcionario values(cedula, nombre,  fechanacimiento, direccion, telefono);
      exception WHEN others then
     raise_application_error(-20001,'Error al insertar en la tabla Funcionario' || SQLERRM);
     end;
    
    procedure pDelete (cedula NUMBER) is
    begin
    DELETE FROM funcionario where funcionario.cedula = cedula;
    exception WHEN others then
     raise_application_error(-20001,'Error al borrar en la tabla Funcionario' || SQLERRM);
    end;
    
    
    procedure pUpdate (nombre VARCHAR2,cedula NUMBER, fechanacimiento DATE, telefono NUMBER, direccion VARCHAR2) is
    begin
    UPDATE Funcionario
    SET Funcionario.nombre = nombre, Funcionario.cedula = cedula, Funcionario.fechanacimiento = fechanacimiento, Funcionario.telefono=telefono, Funcionario.direccion=direccion
    where Funcionario.cedula = cedula;
    exception WHEN others then
     raise_application_error(-20001,'Error al modificar en la tabla Funcionario' || SQLERRM);
    end;
    
    function fConsult (cedula NUMBER) return fn is
    func fn;
    begin
    SELECT *
    INTO func
    FROM funcionario
    WHERE funcionario.cedula = cedula;
    return func;
    exception WHEN others then
     raise_application_error(-20001,'Error al consultar en la tabla Funcionario' || SQLERRM);
    end;
    
    end pkFuncionario;
    
/    
Create or replace PACKAGE pkClientesxProducto is
    
    TYPE cp IS RECORD(id clientesxproductos.id%TYPE, fechainicio clientesxproductos.fechainicio%TYPE, fecharetiro clientesxproductos.fecharetiro%TYPE, clientes_cedula clientesxproductos.clientes_cedula%TYPE, producto_codigo clientesxproductos.producto_codigo%TYPE );
    procedure pInsert (id VARCHAR2, fechainicio DATE, fecharetiro DATE, clientes_cedula NUMBER, producto_codigo VARCHAR2);
    procedure pDelete (id VARCHAR2);
    procedure pUpdate (id VARCHAR2, fechainicio DATE, fecharetiro DATE);
    function fConsult (id VARCHAR2) return cp;
    
    end pkClientesxProducto;
/    
Create or replace PACKAGE body pkClientesxProducto is

     procedure pInsert (id VARCHAR2, fechainicio DATE, fecharetiro DATE, clientes_cedula NUMBER, producto_codigo VARCHAR2) is
     begin
     INSERT INTO clientesxproductos values(id, fechainicio,  fecharetiro, clientes_cedula, producto_codigo);
      exception WHEN others then
     raise_application_error(-20001,'Error al insertar en la tabla ClientesxProducto' || SQLERRM);
     end;
    
    procedure pDelete (id VARCHAR2) is
    begin
    DELETE FROM clientesxproductos where clientesxproductos.id = id;
    exception WHEN others then
     raise_application_error(-20001,'Error al borrar en la tabla ClientesxProducto' || SQLERRM);
    end;
    
    
     procedure pUpdate (id VARCHAR2, fechainicio DATE, fecharetiro DATE) is
     begin
     UPDATE ClientesxProductos
    SET ClientesxProductos.id = id, ClientesxProductos.fechainicio = fechainicio, ClientesxProductos.fecharetiro = fecharetiro
    where ClientesxProductos.id = id;
    exception WHEN others then
     raise_application_error(-20001,'Error al modificar en la tabla ClientesxProducto' || SQLERRM);
     end;
    
    function fConsult (id VARCHAR2) return cp is
    cxp cp;
    begin
    SELECT *
    INTO cxp
    FROM clientesxproductos
    WHERE clientesxproductos.id = id;
    return cxp;
    exception WHEN others then
     raise_application_error(-20001,'Error al consultar en la tabla ClientesxProducto' || SQLERRM);
    end;
    
    end pkClientesxProducto;
    
/    
Create or replace PACKAGE pkSolicitud is

    TYPE s IS RECORD(codigo solicitud.codigo%TYPE, observacion solicitud.observacion%TYPE, tipoanomalia solicitud.tipoanomalia%TYPE, estado solicitud.estado%TYPE, clientes_cedula solicitud.clientes_cedula%TYPE, funcionario_cedula solicitud.funcionario_cedula%TYPE, tiposolicitud_codigo solicitud.tiposolicitud_codigo%TYPE, fechaatencion solicitud.fechaatencion%TYPE, fechaasignacion solicitud.fechaasignacion%TYPE, clientesxproductos_Id solicitud.clientesxproductos_Id%TYPE, tipoProducto solicitud.tipoProducto%TYPE);
    procedure pInsert (codigo NUMBER, observacion VARCHAR2, tipoanomalia VARCHAR2, estado VARCHAR2 , clientes_cedula NUMBER, funcionario_cedula NUMBER, tiposolicitud_codigo VARCHAR2, fechaatencion DATE, fechaasignacion DATE, clientesxproductos_id VARCHAR2, tipoProducto  VARCHAR2);
    procedure pDelete (codigo NUMBER);
    procedure pUpdate (codigo NUMBER, observacion VARCHAR2, tipoanomalia VARCHAR2, estado VARCHAR2 , fechaatencion DATE, fechaasignacion DATE, tipoProducto  VARCHAR2);
    function fConsult (codigo NUMBER) return s;
    
     function fCont (codigo NUMBER) return NUMBER;
    
    end pkSolicitud;
/    
Create or replace PACKAGE body pkSolicitud is

    function fCont (codigo NUMBER) return NUMBER is 
    n NUMBER;
    begin
    
    SELECT COUNT(*) into n
    FROM Solicitud;
    RETURN n+1;
    end;
    
     procedure pInsert (codigo NUMBER, observacion VARCHAR2, tipoanomalia VARCHAR2, estado VARCHAR2 , clientes_cedula NUMBER, funcionario_cedula NUMBER, tiposolicitud_codigo VARCHAR2, fechaatencion DATE, fechaasignacion DATE, clientesxproductos_id VARCHAR2, tipoProducto  VARCHAR2) is
     begin
     INSERT INTO solicitud values(codigo, observacion,  tipoanomalia, estado, clientes_cedula, funcionario_cedula, tiposolicitud_codigo, fechaatencion, fechaasignacion, clientesxproductos_id, tipoProducto);
      exception WHEN others then
     raise_application_error(-20001,'Error al insertar en la tabla Solicitud' || SQLERRM);
     end;
    
    procedure pDelete (codigo NUMBER) is
    begin
    DELETE FROM solicitud where solicitud.codigo = codigo;
    exception WHEN others then
     raise_application_error(-20001,'Error al borrar en la tabla Solicitud' || SQLERRM);
    end;
  
    procedure pUpdate (codigo NUMBER, observacion VARCHAR2, tipoanomalia VARCHAR2, estado VARCHAR2 , fechaatencion DATE, fechaasignacion DATE, tipoProducto  VARCHAR2) is
    begin
    UPDATE Solicitud
    SET Solicitud.codigo=codigo, Solicitud.observacion=observacion, Solicitud.tipoanomalia=tipoanomalia, Solicitud.estado = estado, Solicitud.fechaatencion=fechaatencion, Solicitud.fechaasignacion=fechaasignacion, Solicitud.tipoProducto = tipoProducto
    where Solicitud.codigo=codigo;
    exception WHEN others then
     raise_application_error(-20001,'Error al modificar en la tabla Solicitud' || SQLERRM);
    end;
    
    function fConsult (codigo NUMBER) return s is
    sol s;
    begin
    SELECT *
    INTO sol
    FROM solicitud
    WHERE solicitud.codigo = codigo;
    return sol;
    exception WHEN others then
     raise_application_error(-20001,'Error al consultar en la tabla Solicitud' || SQLERRM);
    
    end;
    
    end pkSolicitud;
/    