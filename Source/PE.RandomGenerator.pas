unit PE.RandomGenerator;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.TypInfo;

type
  ///<summary>Exceptions of this type are raised whenever any of the random generator's rules have been violated.</summary>
  ///<remarks>Examples of rule violations include registering the same data type more than once or attempting to generate a value for an unregistered data type</remarks>
  ERNGException = class(Exception)
  end;

  ///<summary>A singleton entry point for generating random values of type "T"</summary>
  ///<remarks>Since all members are class members, there is no need to create instances of this type. There is no harm in doing so; it is simply not required.</remarks>
  RNG = record
  strict private class var
    FRNGSansParameters: TDictionary<PTypeInfo, TProc>;
  strict private
    ///<summary>Either returns the type info or raises the provided exception message</summary>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if type T does not have type info</exception>
    class function TypeInfoRequired<T>(const AnErrorMessage: string): PTypeInfo; static; inline;
  strict private
    ///<summary>Initializes the resources used by this entity</summary>
    ///<remarks>Since the class constructor is essentially this entity's constructor, we're requiring the compiler to call it and disallowing any potential calls from source code.</remarks>
    class constructor Create();
    ///<summary>Finalizes the resources used by this entity</summary>
    ///<remarks>Since the class destructor is essentially this entity's destructor, we're requiring the compiler to call it and disallowing any potential calls from source code.</remarks>
    class destructor Destroy();
  public
    ///<summary>Returns a random value of type T</summary>
    ///<param name="T">The data type for which a random value is desired</param>
    ///<returns>A random value of data type T (assuming that the registered routine has been tested as well)</returns>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if type T does not have any associated type info [i.e.  <c>(TypeInfo(T) = nil)</c>  ]</exception>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if type T is not registered</exception>
    class function Generate<T>: T; static;
    ///<summary>Returns the list of types which have been registered.</summary>
    ///<returns>An array of <see cref="PTypeInfo"/> values</returns>
    class function RegisteredTypes: TArray<PTypeInfo>; static;
    ///<summary>Registers type T and its associated random generation routine</summary>
    ///<param name="T">The data type you would like to register with the random generator</param>
    ///<param name="RNGRoutine">The random generation routine you would like to register</param>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if type T does not have any associated type info [i.e.  <c>(TypeInfo(T) = nil)</c>  ]</exception>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if the random generation routine is not assigned</exception>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if type T has already been registered</exception>
    class procedure RegisterRNGRoutine<T>(const RNGRoutine: TFunc<T>); static;
    ///<summary>Unregisters type T and its associated random generation routine</summary>
    ///<param name="T">The data type you would like to remove from the random generator</param>
    ///<remarks>Will not raise exceptions for data types that are not registered</remarks>
    ///<exception cref="ERNGException">Raises an <see cref="ERNGException"/> exception if type T does not have any associated type info [i.e.  <c>(TypeInfo(T) = nil)</c>  ]</exception>
    class procedure UnRegisterRNGRoutine<T>(); static;
  end;

resourcestring {Since these resourcestrings are used in generic members, they are required to be included in the interface section}
  rs_Exception_RNG_Generation_NoTypeInfo = 'Unable to generate a random value because the provided type does not seem to have type info';
  rs_Exception_RNG_Registration_NoTypeInfo = 'Unable to register a random generation routine because the provided type does not seem to have type info';
  rs_Exception_RNG_Unregistration_NoTypeInfo = 'Unable to unregister a random generation routine because the provided type does not seem to have type info';
resourcestring {Since these resourcestrings are used in generic members, they are required to be included in the interface section}
  rsf_Exception_RNG_Registration_EmptyRNGRoutine = 'Unable to register a random generation routine for the "%s" type because the provided routine is not assigned';
  rsf_Exception_RNG_Registration_TypeAlreadyRegistered = 'Unable to register a random generation routine because the "%s" type has already been registered';
  rsF_Exception_RNG_Generation_UnregisteredType = 'Unable to generate a random value because the "%s" type has not been registered';

implementation

{ RNG }

class constructor RNG.Create;
begin
  FRNGSansParameters := TDictionary<PTypeInfo, TProc>.Create();
end;

class destructor RNG.Destroy;
begin
  if Assigned(FRNGSansParameters) then
  begin
    FRNGSansParameters.Free;
    FRNGSansParameters := nil;
  end;
end;

class function RNG.Generate<T>: T;
var
  ARoutine: TFunc<T>;
  ARoutinePtr: Pointer;
  ATypeInfo: PTypeInfo;
begin
  //External Validation
  ATypeInfo := TypeInfoRequired<T>(rs_Exception_RNG_Generation_NoTypeInfo);
  //Internal validation
  Assert(Assigned(FRNGSansParameters), 'Unable to continue because the random generator''s internal list of data types and generation routines is not assigned');  // Do Not Localize
  if (not FRNGSansParameters.ContainsKey(ATypeInfo)) then
    raise ERNGException.CreateFmt(rsf_Exception_RNG_Generation_UnregisteredType, [ATypeInfo.Name]);
  //Attempting to call the registered routine for T
  ARoutinePtr := FRNGSansParameters.Items[ATypeInfo];
  Assert(Assigned(ARoutinePtr), 'Fatal error: Automated tests against the registration routine should have prevented an empty generation routine from becoming registered');  // Do Not Localize
  ARoutine := TFunc<T>(ARoutinePtr);
  Result := ARoutine;
end;

class function RNG.RegisteredTypes: TArray<PTypeInfo>;
begin
  //Internal validation
  Assert(Assigned(FRNGSansParameters), 'Unable to continue because the random generator''s internal list of data types and generation routines is not assigned');  // Do Not Localize
  //Returning the type info list
  Result := FRNGSansParameters.Keys.ToArray();
end;

class procedure RNG.RegisterRNGRoutine<T>(const RNGRoutine: TFunc<T>);
var
  ATypeInfo: PTypeInfo;
begin
  //External Validation
  ATypeInfo := TypeInfoRequired<T>(rs_Exception_RNG_Registration_NoTypeInfo);
  if (not Assigned(RNGRoutine)) then
    raise ERNGException.CreateFmt(rsf_Exception_RNG_Registration_EmptyRNGRoutine, [ATypeInfo.Name]);
  //Internal Validation
  Assert(Assigned(FRNGSansParameters), 'Unable to continue because the random generator''s internal list of data types and generation routines is not assigned');  // Do Not Localize
  if FRNGSansParameters.ContainsKey(ATypeInfo) then
    raise ERNGException.CreateFmt(rsf_Exception_RNG_Registration_TypeAlreadyRegistered, [ATypeInfo.Name]);
  //Adding the new type/routine pair
  FRNGSansParameters.Add(ATypeInfo, TProc(RNGRoutine));
end;

class function RNG.TypeInfoRequired<T>(const AnErrorMessage: string): PTypeInfo;
begin
  //Attempting to get type info for T
  Result := TypeInfo(T);
  //Raising an exception if none was found
  if (not Assigned(Result)) then
    raise ERNGException.Create(AnErrorMessage);
end;

class procedure RNG.UnRegisterRNGRoutine<T>;
var
  ATypeInfo: PTypeInfo;
begin
  //External Validation
  ATypeInfo := TypeInfoRequired<T>(rs_Exception_RNG_Unregistration_NoTypeInfo);
  //Internal Validation
  Assert(Assigned(FRNGSansParameters), 'Unable to continue because the random generator''s internal list of data types and generation routines is not assigned');  // Do Not Localize
  //Attempting to remove the type from the internal list
  FRNGSansParameters.Remove(ATypeInfo);
end;

end.
