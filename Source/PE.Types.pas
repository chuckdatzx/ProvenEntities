unit PE.Types;
{Chuck C.T.
 Keep in mind that pretty much everything from here is defined from an intuitionistic perspective.
 The type names and what said types represent may not match what you currently think of as intuition;
 especially if you started from a Pascal/Object Pascal/Delphi background like I did.
}
interface

type {Foundational Types}
  NaturalNumber = type Cardinal;
  NaturalNumber32 = NaturalNumber;
  NaturalNumber64 = type UInt64;

type {Foundational Array Types}
  NaturalNumberArray = TArray<NaturalNumber>;

type
  SmartClaw<T> = reference to function (const AValue: T): Boolean;

implementation

end.
