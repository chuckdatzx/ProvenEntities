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
  PE.Tests,
  PE.Types.Foundational.Generics;  //Included to provide better support/handling of foundational types

{$IF PE.Tests.ExecuteTypeAndValueCompleteProof}  //Requiring "opting out" of type complete and value complete testing of the Foundational types
type
  BigNaturalNumber = type UInt64;
  Digit = 0..9;
  MonoChar = type Char;
  NaturalNumber = type Cardinal;
  {$MESSAGE HINT 'All types in the PE.Types.Foundational namespace appear to include type complete and value complete testing coverage'}
{$ELSE}
type
  BigNaturalNumber = type UInt64;
  Digit = 0..9;
  MonoChar = type Char;
  NaturalNumber = type Cardinal;
  {$MESSAGE WARN 'Type complete and value complete coverage may have been intentionally avoided for all types in the PE.Types.Foundational namespace'}
{$ENDIF}

type
  BigNaturalNumberCharHelper = record Helper for BigNaturalNumber
  {public :: "Class Properties"}
    public const Max: BigNaturalNumber = System.High(BigNaturalNumber);
    public const Min: BigNaturalNumber = System.Low(BigNaturalNumber);
  end;

  DigitHelper = record Helper for Digit
  public type StaticTransformations = record
    public const DigitToEnglishMonoCharMap: array [System.Low(Digit)..System.High(Digit)] of MonoChar = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
  end;
  {public :: "Class Properties"}
    public const Max: Digit = System.High(Digit);
    public const Min: Digit = System.Low(Digit);
  end;

  MonoCharHelper = record Helper for MonoChar
  {public :: "Class Properties"}
    public const Max: MonoChar = System.High(MonoChar);
    public const Min: MonoChar = System.Low(MonoChar);
  end;

  NaturalNumberHelper = record Helper for NaturalNumber
  {public "Class Properties"}
    public const Max: NaturalNumber = System.High(NaturalNumber);
    public const Min: NaturalNumber = System.Low(NaturalNumber);
  {public (Transformations)}
    public class function FromArrayOfDigit(const Values: ArrayOf<Digit>): NaturalNumber; static; //inline;
    public class function ToArrayOfDigit(const Value: NaturalNumber): ArrayOf<Digit>; static; inline;
    public class function ToArrayOfMonoChar(const Value: NaturalNumber): ArrayOf<MonoChar>; static; inline;
  end;

implementation

{NaturalNumberHelper}
class function NaturalNumberHelper.FromArrayOfDigit(const Values: ArrayOf<Digit>): NaturalNumber;
begin
  Result := System.Default(NaturalNumber);
  System.Assert(10 >= System.Length(Values), 'Since the 4294967295 is the maximum allowed NaturalNumber value, transforming from an ArrayOf<Digit> means only 10 Digit elements could be allowed');
  for var Each: Digit in Values do
    Result := (Result * 10) + Each;
end;

class function NaturalNumberHelper.ToArrayOfDigit(const Value: NaturalNumber): ArrayOf<Digit>;
begin
  if (Value > 0) then
  begin
    Result := [];
    var TempValue := Value;
    repeat
      Result := [TempValue mod 10] + Result;
      TempValue := TempValue div 10;
    until TempValue = 0;
  end
  else
    Result := [0];
end;

class function NaturalNumberHelper.ToArrayOfMonoChar(const Value: NaturalNumber): ArrayOf<MonoChar>;
begin
  var Digits: ArrayOf<Digit> := ToArrayOfDigit(Value);
  Result := [];
  for var Each: Digit in Digits do
    Result := Result + [Digit.StaticTransformations.DigitToEnglishMonoCharMap[Each]];
end;

end.
