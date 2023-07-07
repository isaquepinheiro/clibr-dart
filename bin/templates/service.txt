unit {unitName}.service;

interface

type
  {serviceName} = class
  public
    function Ping: string;
  end;

implementation

{ {serviceName} }

function {serviceName}.Ping: string;
begin
  Result := 'Pong';
end;

end.
