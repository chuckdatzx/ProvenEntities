unit PE.Types.Composite;

interface

type
  ArrayOf<T> = array of T;

type
  SmartClaw<T> = reference to function (const AValue: T): Boolean;

implementation

end.
