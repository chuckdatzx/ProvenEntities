unit PE.Tests.Execute;

interface

uses
  PE.Tests.TypeCompleteAndValueComplete.ArrayOf,  //In the interface section for inlining
  PE.Tests.Types.Foundational.BigNaturalNumber.TypeAndValueComplete,  //In the interface section for inlining
  PE.Tests.Types.Foundational.Digit.TypeAndValueComplete,  //In the interface section for inlining
  PE.Tests.Types.Foundational.MonoChar.TypeAndValueComplete,  //In the interface section for inlining
  PE.Tests.Types.Foundational.NaturalNumber.TypeAndValueComplete;  //In the interface section for inlining

procedure DoExecuteTypeAndValueCompleteProof(); inline;

implementation

uses
  PE.Types.Foundational;

procedure DoExecuteTypeAndValueCompleteProof();
begin
  ExecutableSpecification_BigNaturalNumber_Complete.Exercise();
  ExecutableSpecification_Digit_Complete.Exercise();
  ExecutableSpecification_MonoChar_Complete.Exercise();
  ExecutableSpecification_NaturalNumber_Complete.Exercise();
  {Foundational types by foundational generic types}
  ExecutableSpecification_ArrayOf_Complete<Digit>.Exercise();
  ExecutableSpecification_ArrayOf_Complete<MonoChar>.Exercise();
  ExecutableSpecification_ArrayOf_Complete<NaturalNumber>.Exercise();
  {$IFDEF CPU64BITS}
  ExecutableSpecification_ArrayOf_Complete<BigNaturalNumber>.Exercise(); //Currently causes (F2084 Internal Error: C2252) in Win32 platform
  {$ELSE}
    {$MESSAGE WARN 'PE.Types.Foundational.Generics.ArrayOf<T> cannot be proven for the BigNaturalNumber type (other NaturalNumber variations are proven)'}
  {$IFEND}
end;

end.
