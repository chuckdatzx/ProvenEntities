unit PE.Tests.Execute;

interface

uses
  PE.Tests.Types.Foundational.Digit.TypeAndValueComplete,  //In the interface section for inlining
  PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete,  //In the interface section for inlining
  PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete;  //In the interface section for inlining

procedure DoExecuteTypeAndValueCompleteProof(); inline;

implementation

procedure DoExecuteTypeAndValueCompleteProof();
begin
  ExecutableSpecification_Digit_Complete.Exercise();
  ExecutableSpecification_MonoChar_Complete.Exercise();
  ExecutableSpecification_NaturalNumber_Complete.Exercise();
end;

end.
