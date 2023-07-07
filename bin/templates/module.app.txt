unit {unitName}.module;

interface

uses
  ping.module,
  ping.route.handler,
  dmfbr.module;
{guardHeader}
type
  {moduleName} = class(TModule)
  public
    function Imports: TImports; override;
    function Binds: TBinds; override;
    function Routes: TRoutes; override;
    function RouteHandlers: TRouteHandlers; override;
    function ExportedBinds: TExportedBinds; override;
  end;

implementation

{ {moduleName} }

function {moduleName}.Binds: TBinds;
begin
  Result := [];
end;

function {moduleName}.ExportedBinds: TExportedBinds;
begin
  Result := [];
end;

function {moduleName}.Imports: TImports;
begin
  Result := [];
end;

function {moduleName}.RouteHandlers: TRouteHandlers;
begin
  Result := [TPingRouteHandler];
end;

function {moduleName}.Routes: TRoutes;
begin
  Result := [RouteModule('/ping', TPingModule)];
end;
{guardCode}
end.