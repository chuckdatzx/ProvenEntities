unit PE.Types;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}  //In compiler (we currently) trust!
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
  PE.Tests;

{$IF PE.Tests.ExecuteTypeAndValueCompleteProof}  //Requiring "opting out" of type complete and value complete testing of the Foundational types
type {Discrete Types}
  Digit = 0..9;
  MonoChar = type Char;
  NaturalNumber = type Cardinal;
type {Unbound Types}
  ArrayOf<T> = array of T;
  {$MESSAGE HINT '😎 :: The PE.Types are on track to include their type complete and value complete coverage'}
{$ELSE}
type {Discrete Types}
  Digit = 0..9;
  MonoChar = type Char;
  NaturalNumber = type Cardinal;
type {Unbound Types}
  ArrayOf<T> = array of T;
  {$MESSAGE WARN '😮 :: The PE.Types test coverage does not seem to be included'}
{$ENDIF}

type
  DigitHelper = record Helper for Digit
  {Internal Members}
    strict private class function GetTypeIdentity(): Pointer; static; inline;
  {public :: Class Properties}
    public class property TypeIdentity: Pointer read GetTypeIdentity;
  {public :: "Class Properties"}
    public const MonoCharMap: array [System.Low(Digit)..System.High(Digit)] of MonoChar = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    public const Max: Digit = System.High(Digit);
    public const Min: Digit = System.Low(Digit);
  end;

  MonoCharHelper = record Helper for MonoChar
  {Internal Members}
    strict private class function GetTypeIdentity(): Pointer; static; inline;
  {public :: Class Properties}
    public class property TypeIdentity: Pointer read GetTypeIdentity;
  {public :: "Class Properties"}
    public const Max: MonoChar = System.High(MonoChar);
    public const Min: MonoChar = System.Low(MonoChar);
  end;

  NaturalNumberHelper = record Helper for NaturalNumber
  {Internal Members}
    strict private class function GetTypeIdentity(): Pointer; static; inline;
  {public :: Class Properties}
    public class property TypeIdentity: Pointer read GetTypeIdentity;
  {public "Class Properties"}
    public const Max: NaturalNumber = System.High(NaturalNumber);
    public const Min: NaturalNumber = System.Low(NaturalNumber);
  end;

implementation

{DigitHelper}
class function DigitHelper.GetTypeIdentity: Pointer;
begin
  Result := System.TypeInfo(Digit);
end;

{MonoCharHelper}
class function MonoCharHelper.GetTypeIdentity: Pointer;
begin
  Result := System.TypeInfo(MonoChar);
end;

{NaturalNumberHelper}
class function NaturalNumberHelper.GetTypeIdentity: Pointer;
begin
  Result := System.TypeInfo(NaturalNumber);
end;

end.
