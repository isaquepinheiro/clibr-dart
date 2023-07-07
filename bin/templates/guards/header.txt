
type
  {className}Guard = class(TRouteMiddleware)
  public
    class function Call(const AReq: IRouteRequest): boolean; override;
  end;
  