unit {unitName}.route.handler;

interface

uses
  SysUtils,
  result.pair,
  dmfbr.modular,
  {unitName}.controller,
  dmfbr.route.handler;

type
  {handlerName} = class(TRouteHandler)
  protected
    procedure RegisterRoutes; override;
  public
    function Ping: string;
  end;

implementation

uses
  dmfbr.route.abstract;

{ {handlerName} }

procedure {handlerName}.RegisterRoutes;
begin

end;

function {handlerName}.Ping: string;
var
  LResultPing: string;
  LResultRoute: TResultPair<Exception, TRouteAbstract>;
begin
  LResultPing := '';
  LResultRoute := Modular.LoadRouteModule('/ping');
  try
    LResultRoute.TryException(
      procedure (Error: Exception)
      begin
        // Failure
        LResultPing := Error.Message;
        Error.Free;
      end,
      procedure (Route: TRouteAbstract)
      begin
        // Success
        LResultPing := Modular.Get<T{className}Controller>.Ping;
      end);
   finally
     Modular.DisposeRouteModule('/ping');
   end;
  Result := LResultPing;
end;

end.