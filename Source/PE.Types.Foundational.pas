unit PE.Types.Foundational;

interface

uses
  {PE}
  PE.Delphi.TypeIdentity;

{$IF (not DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

type
  MonoChar = type Char;
  NaturalNumber = type Cardinal;
  NaturalNumber32 = NaturalNumber;
  NaturalNumber64 = type UInt64;

implementation

end.
