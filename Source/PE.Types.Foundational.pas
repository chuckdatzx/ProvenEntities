unit PE.Types.Foundational;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$DENYPACKAGEUNIT ON}
{$EXTENDEDSYNTAX ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
{$IMPLICITBUILD OFF}
{$IMPORTEDDATA OFF}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$OPTIMIZATION ON}
{$POINTERMATH OFF}
{$RANGECHECKS ON}
{$REFERENCEINFO ON}
{$SCOPEDENUMS ON}
{$STACKFRAMES OFF}
{$WARNINGS ON}
{$WRITEABLECONST OFF}
interface

uses
  PE.Delphi.TypeIdentity,
  PE.Types.Foundational.Generics;  //Included to provide better support/handling of foundational types

{$IF (not DelphiTypeIdentityEstablishedAtCompileTime)}
   {$MESSAGE FATAL 'Unable to continue without compile-time proof established.'}
{$ENDIF}

type
  Digit = 0..9;

type
  MonoChar = type Char;
  NaturalNumber = type Cardinal;
  BigNaturalNumber = type UInt64;

type
  DigitHelper = record Helper for Digit
  {private}
    strict private const DigitToMonoCharMap: array [System.Low(Digit)..System.High(Digit)] of MonoChar = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    strict private const MonoCharToDigitMap: array ['0'..'9'] of Digit = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
  {public}
    public class function ToMonoChar(const AValue: Digit): MonoChar; static; inline;
  end;

  NaturalNumberHelper = record Helper for NaturalNumber
  {public}
    public const Max: NaturalNumber = System.High(NaturalNumber);
    public const Min: NaturalNumber = System.Low(NaturalNumber);
    public class function FromArrayOfDigit(const Values: ArrayOf<Digit>): NaturalNumber; static; inline;
  end;

implementation

{DigitHelper}
class function DigitHelper.ToMonoChar(const AValue: Digit): MonoChar;
begin
  Result := DigitToMonoCharMap[AValue];
end;

{NaturalNumberHelper}
class function NaturalNumberHelper.FromArrayOfDigit(const Values: ArrayOf<Digit>): NaturalNumber;
begin
  Result := System.Default(NaturalNumber);
  System.Assert(10 >= System.Length(Values), 'Since the 4294967295 is the maximum allowed NaturalNumber value, converting from an ArrayOf<Digit> means only 10 elements are allowed');
  for var Each: Digit in values do
    Result := (Result * 10) + Each;
end;

end.
