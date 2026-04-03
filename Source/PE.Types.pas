unit PE.Types;
{Chuck C.T.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}
interface

type {Foundational Types}
  ArrayOf<T> = array of T;
  NaturalNumber = type Cardinal;
  NaturalNumber32 = NaturalNumber;
  NaturalNumber64 = type UInt64;

type
  SmartClaw<T> = reference to function (const AValue: T): Boolean;

implementation

end.
