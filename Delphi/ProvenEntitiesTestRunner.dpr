program ProvenEntitiesTestRunner;
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEFINITIONINFO ON}
{$EXTENDEDSYNTAX ON}
{$HIGHCHARUNICODE ON}
{$HINTS ON}
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
{Chuck C.T.
Full Declaration of Transparency:
You should only consider the code under test proven insofar as you agree with everything presented
(and by "everything presented", I mean from the scope of the compiler all the way through to
your custom code based on entities from this project).

I'm truly not trying to scare anyone off. I'm perfectly comfortable calling the following proven;
and I have researched from the compiler to my code. I'm simply recommending that you do the same
and not just assume, without pause, that it is unbreakable.}

{
Formal Declaration of Proof Methodology:
Every Test Case (i.e. method) is a discrete and executable theorem, proposing some "desired fact of existence" for the Type In Question (TIQ); and each theorem does so through and against the System Under Test (SUT)
Since the Law of Excluded Middle simply does not apply to our context of proof, yet it is obviously a reality that must be handled in every programming language, I will be introducing new types into Delphi in the most
diametrically opposed manner I can wield and compile (if you find something even more obtuse than I have, let me know).

Okay... So why are you playing this game on hardcode mode?

Because if I am able to integrate actively hostile, yet incredibly useful, constructs into Delphi, then I am effectively leveraging my expertise in a form of proof that must be accepted if all
Test Cases are indeed True (which also means any other expert in any other language could be doing the same!).

Notes regarding TC's and their associated TIQ's:
Every Test Case requires an observer from the SUT.
  - The purpose of the observer is to serve as both a witness and a source of truth, such that the expressed intent of the Test Case has successfully melded TIQ into the SUT.
}

{$APPTYPE CONSOLE}

uses
  PE.BoundedTypes.Digit in '..\Source\PE.BoundedTypes.Digit.pas';

begin
  Randomize();
  ExitCode := MaxInt;
  System.WriteLn('Starting Tests...');
  ExecutableSpecification_Digit_Type.Exercise();
  ExitCode := 0;
  System.WriteLn('Tests Complete...');
  System.Writeln('Press any key to close the application');
  ReadLn;
  Exit;
end.
