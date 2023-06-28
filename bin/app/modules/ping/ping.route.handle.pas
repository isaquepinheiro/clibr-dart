unit ping.route.handle;

interface

uses
  Horse,
  dmfbr.modular,
  ping.controller,
  dmfbr.route.handle;

type
  TPingRouteHandle = class(TRouteHandler)
  protected
    procedure RegisterRoutes; override;
  public
    procedure Ping(Req: THorseRequest; Res: THorseResponse);
  end;

implementation

{ TPingRouteHandle }

procedure TPingRouteHandle.RegisterRoutes;
begin
  THorse.Get('/ping', Ping);
end;

procedure TPingRouteHandle.Ping(Req: THorseRequest; Res: THorseResponse);
var
  LResult: string;
begin
  LResult := Modular.Get<TPingController>.Ping;
  Res.Send(LResult).Status(200);
end;

end.