unit {unitName}.module;

interface

uses
  {unitName}.controller,
  {unitName}.service,
  dmfbr.module;

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
  Result := [Bind<T{className}Service>.Factory,
             Bind<T{className}Controller>.Singleton];
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
  Result := [];
end;

function {moduleName}.Routes: TRoutes;
begin
  Result := [];
end;

end.
