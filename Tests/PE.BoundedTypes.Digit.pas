unit PE.BoundedTypes.Digit;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$DENYPACKAGEUNIT ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
{$IMPLICITBUILD OFF}
{$IMPORTEDDATA OFF}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$POINTERMATH OFF}
{$RANGECHECKS ON}
{$REFERENCEINFO ON}
{$SCOPEDENUMS ON}
{$STACKFRAMES ON}
{$WARNINGS ON}
{$WRITEABLECONST OFF}
interface
{PSA: If something happens during compilation such that my intent is shifted, including something as innocuous as accidentally
 compiling in a context I didn't account for, then you just become the new source of proof. This is not some random disclaimer,
 business generated liability claim, or any other such bullshittery. This is simply part of having executable proof.
 Since this proof is 100% based off of my intentions expressed through my words and my code, it only follows that my intent
 cannot be altered.

 It also only follows that I am responsible for completely and clearly presenting my intent. So if you find any problems, please
 feel free to let me know. But please beware that I am in the business (lol. sorry, just remembered that I am unemployed) of
 proving well-intentioned code. I am not in the business of proving out code that cannot be hacked. As far as a I am concerned,
 I could easily argue that security is the problem of the executing medium (not the logic executing in said medium)
}
//  {#DEFINE FULLINLINE}

{$IFDEF FULLINLINE} {$OPTIMIZATION ON} {$ELSE} {$OPTIMIZATION OFF} {$ENDIF}

type
  Digit = record
  public
    const Zero = 0;
    const One = 1;
    const Two = 2;
    const Three = 3;
    const Four = 4;
    const Five = 5;
    const Six = 6;
    const Seven = 7;
    const Eight = 8;
    const Nine = 9;
    const Min = Zero;
    const Max = Nine;
    type Range = Min..Max;
  strict private
    class var FDelphiTypeIdentity: Pointer;
    class function InternalStaticOperator_VsInteger_Equals(const DigitValue: Digit; const IntegerValue: Integer): Boolean; static; inline;
  strict private
    FValue: Byte;
  strict private
    procedure SetValue(const AValue: Range); inline;
  public
    class constructor Create();
  public
    class operator Equal(const Left, Right: Digit): Boolean;
    class operator Equal(const Left: Integer; const Right: Digit): Boolean; static; inline;
    class operator Equal(const Left: Digit; const Right: Integer): Boolean; static; inline;
    class operator Implicit(const AValue: Range): Digit; static; inline;
  public
    class property TypeIdentity: Pointer read FDelphiTypeIdentity;
  end;

  ExecutableSpecification_Digit_Type = record
  strict private
    class procedure TheSUTRecognizesTheTermDigitDotZeroAsEquatingToTheSUTValueOf0AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotOneAsEquatingToTheSUTValueOf1AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotTwoAsEquatingToTheSUTValueOf2AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotThreeAsEquatingToTheSUTValueOf3AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotFourAsEquatingToTheSUTValueOf4AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotFiveAsEquatingToTheSUTValueOf5AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotSixAsEquatingToTheSUTValueOf6AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotSevenAsEquatingToTheSUTValueOf7AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotEightAsEquatingToTheSUTValueOf8AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
    class procedure TheSUTRecognizesTheTermDigitDotNineAsEquatingToTheSUTValueOf9AsObservedByTheSUTIntegerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
  strict private
    class procedure TheSUTRecognizesTheDigitDotRangeAsBeingComprisedOfAllPreviouslyDefinedDigitNumericTermsAsObservedByThePreviouslyDefinedDigitNumericTerms(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
  strict private
    class procedure TheSUTRecognizesTheDigitTypeAsAnEntityThatHasTypeIdentityAsObservedByTheSUTPointerType(); static; {$IFDEF FULLINLINE} inline; {$ENDIF}
  public
    class procedure Exercise(); static; inline;
  end;

implementation

{ExecutableSpecification_Digit_Type}
class procedure ExecutableSpecification_Digit_Type.Exercise;
begin
  TheSUTRecognizesTheTermDigitDotZeroAsEquatingToTheSUTValueOf0AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotOneAsEquatingToTheSUTValueOf1AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotTwoAsEquatingToTheSUTValueOf2AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotThreeAsEquatingToTheSUTValueOf3AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotFourAsEquatingToTheSUTValueOf4AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotFiveAsEquatingToTheSUTValueOf5AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotSixAsEquatingToTheSUTValueOf6AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotSevenAsEquatingToTheSUTValueOf7AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotEightAsEquatingToTheSUTValueOf8AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheTermDigitDotNineAsEquatingToTheSUTValueOf9AsObservedByTheSUTIntegerType();
  TheSUTRecognizesTheDigitDotRangeAsBeingComprisedOfAllPreviouslyDefinedDigitNumericTermsAsObservedByThePreviouslyDefinedDigitNumericTerms();
  //
  TheSUTRecognizesTheDigitTypeAsAnEntityThatHasTypeIdentityAsObservedByTheSUTPointerType();
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheDigitTypeAsAnEntityThatHasTypeIdentityAsObservedByTheSUTPointerType();
begin
  var Observer: Pointer := nil;
  System.Assert(not System.Assigned(Observer));
  System.Assert(System.Assigned(Digit.TypeIdentity));
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotZeroAsEquatingToTheSUTValueOf0AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 0;
  System.Assert(0 = Observer);
  System.Assert(Observer = 0);
  System.Assert(Digit.Zero = 0);
  System.Assert(0 = Digit.Zero);
  System.Assert(Observer = Digit.Zero);
  System.Assert(Digit.Zero = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheDigitDotRangeAsBeingComprisedOfAllPreviouslyDefinedDigitNumericTermsAsObservedByThePreviouslyDefinedDigitNumericTerms();
begin
  //First, let's validate our boundaries against the SUT
  System.Assert(Digit.Zero = System.Low(Digit.Range));
  System.Assert(System.Low(Digit.Range) = Digit.Zero);
  System.Assert(Digit.Nine = System.High(Digit.Range));
  System.Assert(System.High(Digit.Range) = Digit.Nine);
  //Now let's verify the rest of the Digit.Range
  System.Assert(Digit.One = System.Succ(Low(Digit.Range)));
  System.Assert(Digit.Two = System.Succ(System.Succ(Low(Digit.Range))));
  System.Assert(Digit.Three = System.Succ(System.Succ(System.Succ(Low(Digit.Range)))));
  System.Assert(Digit.Four = System.Succ(System.Succ(System.Succ(System.Succ(Low(Digit.Range))))));
  System.Assert(Digit.Five = System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(Low(Digit.Range)))))));
  System.Assert(Digit.Six = System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(Low(Digit.Range))))))));
  System.Assert(Digit.Seven = System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(Low(Digit.Range)))))))));
  System.Assert(Digit.Eight = System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(System.Succ(Low(Digit.Range))))))))));
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotEightAsEquatingToTheSUTValueOf8AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 8;
  System.Assert(8 = Observer);
  System.Assert(Observer = 8);
  System.Assert(Digit.Eight = 8);
  System.Assert(8 = Digit.Eight);
  System.Assert(Observer = Digit.Eight);
  System.Assert(Digit.Eight = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotFiveAsEquatingToTheSUTValueOf5AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 5;
  System.Assert(5 = Observer);
  System.Assert(Observer = 5);
  System.Assert(Digit.Five = 5);
  System.Assert(5 = Digit.Five);
  System.Assert(Observer = Digit.Five);
  System.Assert(Digit.Five = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotFourAsEquatingToTheSUTValueOf4AsObservedByTheSUTIntegerType;
begin
  var Observer: Integer := 4;
  System.Assert(4 = Observer);
  System.Assert(Observer = 4);
  System.Assert(Digit.Four = 4);
  System.Assert(4 = Digit.Four);
  System.Assert(Observer = Digit.Four);
  System.Assert(Digit.Four = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotNineAsEquatingToTheSUTValueOf9AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 9;
  System.Assert(9 = Observer);
  System.Assert(Observer = 9);
  System.Assert(Digit.Nine = 9);
  System.Assert(9 = Digit.Nine);
  System.Assert(Observer = Digit.Nine);
  System.Assert(Digit.Nine = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotOneAsEquatingToTheSUTValueOf1AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 1;
  System.Assert(1 = Observer);
  System.Assert(Observer = 1);
  System.Assert(Digit.One = 1);
  System.Assert(1 = Digit.One);
  System.Assert(Observer = Digit.One);
  System.Assert(Digit.One = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotSevenAsEquatingToTheSUTValueOf7AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 7;
  System.Assert(7 = Observer);
  System.Assert(Observer = 7);
  System.Assert(Digit.Seven = 7);
  System.Assert(7 = Digit.Seven);
  System.Assert(Observer = Digit.Seven);
  System.Assert(Digit.Seven = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotSixAsEquatingToTheSUTValueOf6AsObservedByTheSUTIntegerType();
begin
  var Observer: Integer := 6;
  System.Assert(6 = Observer);
  System.Assert(Observer = 6);
  System.Assert(Digit.Six = 6);
  System.Assert(6 = Digit.Six);
  System.Assert(Observer = Digit.Six);
  System.Assert(Digit.Six = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotThreeAsEquatingToTheSUTValueOf3AsObservedByTheSUTIntegerType;
begin
  var Observer: Integer := 3;
  System.Assert(3 = Observer);
  System.Assert(Observer = 3);
  System.Assert(Digit.Three = 3);
  System.Assert(3 = Digit.Three);
  System.Assert(Observer = Digit.Three);
  System.Assert(Digit.Three = Observer);
end;

class procedure ExecutableSpecification_Digit_Type.TheSUTRecognizesTheTermDigitDotTwoAsEquatingToTheSUTValueOf2AsObservedByTheSUTIntegerType;
begin
  var Observer: Integer := 2;
  System.Assert(2 = Observer);
  System.Assert(Observer = 2);
  System.Assert(Digit.Two = 2);
  System.Assert(2 = Digit.Two);
  System.Assert(Observer = Digit.Two);
  System.Assert(Digit.Two = Observer);
end;

class constructor Digit.Create();
begin
  FDelphiTypeIdentity := System.TypeInfo(Digit);
  ExecutableSpecification_Digit_Type.Exercise();
end;

class operator Digit.Equal(const Left: Integer; const Right: Digit) : Boolean;
begin
  Result := InternalStaticOperator_VsInteger_Equals(Right, Left);
end;

class operator Digit.Equal(const Left: Digit; const Right: Integer) : Boolean;
begin
  Result := InternalStaticOperator_VsInteger_Equals(Left, Right);
end;

class operator Digit.Equal(const Left, Right: Digit): Boolean;
begin
  Result := Left.FValue = Right.FValue;
end;

class operator Digit.Implicit(const AValue: Range): Digit;
begin
  Result.SetValue(AValue);
end;

class function Digit.InternalStaticOperator_VsInteger_Equals(const DigitValue: Digit; const IntegerValue: Integer): Boolean;
begin
  case IntegerValue of
    0: Result := (Zero = 0);
    1: Result := (One = 1);
    2: Result := (Two = 2);
    3: Result := (Three = 3);
    4: Result := (Four = 4);
    5: Result := (Five = 5);
    6: Result := (Six = 6);
    7: Result := (Seven = 7);
    8: Result := (Eight = 8);
    9: Result := (Nine = 9);
  else
    Result := False;
    System.Halt;
  end;
end;

procedure Digit.SetValue(const AValue: Range);
begin
  System.Assert((AValue >= Min) and (AValue <= Max));
  FValue := AValue;
end;

end.
