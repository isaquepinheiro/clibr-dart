unit ping.controller;

interface

type
  TPingController = class
  public
    constructor Create;
    destructor Destroy; override;
    function Ping: string;
  end;

implementation

{ TPingController }

constructor TPingController.Create;
begin

end;

destructor TPingController.Destroy;
begin

  inherited;
end;

function TPingController.Ping: String;
begin
  Result := 'Pong';
end;

end.