unit PE.Types;

interface

type
  NaturalNumber = type Cardinal;
  NaturalNumber32 = NaturalNumber;
  NaturalNumber64 = type UInt64;

type
  SmartClaw<T> = reference to function (const AValue: T): Boolean;

implementation

end.
