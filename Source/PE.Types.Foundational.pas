unit PE.Types.Foundational;

interface

uses
  System.SysUtils,
  {PE}
  PE.Delphi.TypeIdentity;

{$IF (not DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

type
  Digit = 0..9;

  MonoChar = type Char;
  NaturalNumber = type Cardinal;
  NaturalNumber32 = NaturalNumber;
  NaturalNumber64 = type UInt64;

type
  NaturalNumberHelper = record Helper for NaturalNumber
    public const Max: NaturalNumber = System.High(NaturalNumber);
    public const Min: NaturalNumber = System.Low(NaturalNumber);
  end;

implementation

end.
