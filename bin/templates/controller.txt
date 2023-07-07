unit {unitName}.controller;

interface

uses
  {unitName}.service;

type
  {controllerName} = class
  private
    FService: T{className}Service;
  public
    constructor Create(const AService: T{className}Service);
    destructor Destroy; override;
    function Ping: string;
  end;

implementation

{ {controllerName} }

constructor {controllerName}.Create(const AService: T{className}Service);
begin
  FService := AService;
end;

destructor {controllerName}.Destroy;
begin
  FService.Free;
  inherited;
end;

function {controllerName}.Ping: string;
begin
  Result := FService.Ping;
end;

end.