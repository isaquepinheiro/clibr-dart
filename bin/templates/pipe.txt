unit {unitName}.pipe;

interface

uses
  Rtti,
  SysUtils,
  dmfbr.transform.pipe,
  dmfbr.transform.interfaces;

type
  {pipeName} = class(TTransformPipe)
  public
    function Transform(const Value: TValue;
      const Metadata: ITransformArguments): TResultTransform; override;
  end;

implementation

{ {pipeName} }

function {pipeName}.Transform(const Value: TValue;
  const Metadata: ITransformArguments): TResultTransform;
begin
  // success
  Result.Success(true);
  // fail
  // Result.Failure('failure');
end;

end.
