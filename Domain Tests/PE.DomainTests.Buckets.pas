unit PE.DomainTests.Buckets;

interface

uses
  {PE}
  PE.Buckets;

type
  DomainTests<T> = record
  public
    class procedure Exercise(); static; inline;
  end;

  CategorizeRoutine_SignatureTests<T> = record
  strict private class var Dummy_Param1: TArray<T>;
  strict private class var Dummy_Param2: TArray<BucketIn<T>>;
  strict private class var ActualResult: TArray<BucketOut>;
  private
    class procedure ReturnsAnEmptyArrayOfBucketOut(); static; inline;
    class procedure TheFirstParameterAcceptsAnEmptyTArrayOfT(); static; inline;
    class procedure TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT(); static; inline;
  end;

  //Keep in mind Chuck:: We're just looking for surface coverage here (ignore runtime vs. compile-time [for the time being])

  CategorizeRoutine_ResultCount<T> = record
  strict private {Single Instances}
    strict private class var DefaultBucketIn: BucketIn<T>;
    strict private class var DefaultBucketOut: BucketOut;
    strict private class var DefaultT: T;
  strict private {Single Element Arrays}
    strict private class var DataStream_SingleElement_Default: TArray<T>;
  strict private {Multiple Element Arrays}
    strict private class var ContiguousMultipleDefaultBucketInArray: TArray<BucketIn<T>>;
    strict private class var ContiguousMultipleDefaultDataStreamOfT: TArray<T>;
  private {1 Default BucketIn<T> :: Varied Data Stream (# of elements varied and all elements are of Default(T)) :: 1 Default Bucket Out}
    class procedure GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut(); static; inline;
    class procedure GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut(); static; inline;
    class procedure GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut(); static; inline;
  public
    class constructor Create();
  end;


implementation

class procedure CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();
begin
  ActualResult := Routines.Categorize<T>(Dummy_Param1, Dummy_Param2);
end;

class procedure CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
begin
  Routines.Categorize<T>([], Dummy_Param2);
end;

class procedure CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
begin
  Routines.Categorize<T>(Dummy_Param1, []);
end;

class constructor CategorizeRoutine_ResultCount<T>.Create;
begin
  //Single instance
  Assert(Default(T) = DefaultT);

  DataStream_SingleElement_Default := [Default(T)];
  Assert(1 = Length(DataStream_SingleElement_Default));

  ContiguousMultipleDefaultBucketInArray := [BucketIn<T>.Default(), BucketIn<T>.Default(), BucketIn<T>.Default()];
  Assert(3 = Length(ContiguousMultipleDefaultBucketInArray));

  ContiguousMultipleDefaultDataStreamOfT := [Default(T), Default(T), Default(T)];
  Assert(3 = Length(ContiguousMultipleDefaultDataStreamOfT));
end;

class procedure CategorizeRoutine_ResultCount<T>.GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
var
  Actual: TArray<BucketOut>;
begin
  Actual := Routines.Categorize<T>([], [DefaultBucketIn]);
  Assert(1 = Length(Actual));
  Assert(DefaultBucketOut = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([DefaultT], [DefaultBucketIn]);
  Assert(1 = Length(Actual));
  Assert(DefaultBucketOut = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>(ContiguousMultipleDefaultDataStreamOfT, [DefaultBucketIn]);
  Assert(1 = Length(Actual));
  Assert(DefaultBucketOut = Actual[Low(Actual)]);
end;

class procedure DomainTests<T>.Exercise();
begin
  CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
  CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
  CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();

  CategorizeRoutine_ResultCount<T>.GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
end;

end.
