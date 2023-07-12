unit {unitName}.route.handler;

interface

uses
  Horse,
  dmfbr.modular,
  {className}.controller,
  dmfbr.route.handler.horse;

type
  {handlerName} = class(TRouteHandlerHorse)
  protected
    procedure RegisterRoutes; override;
  public
    procedure Ping(Req: THorseRequest; Res: THorseResponse);
  end;

implementation

{ {handlerName} }

procedure {handlerName}.RegisterRoutes;
begin
  RouteGet('/ping', Ping);
end;

procedure {handlerName}.Ping(Req: THorseRequest; Res: THorseResponse);
var
  LResult: string;
begin
  LResult := Modular.Get<T{className}Controller>.Ping;
  Res.Send(LResult).Status(200);
end;

end.