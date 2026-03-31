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
  private
    class procedure ReturnsAnEmptyArrayOfBucketOut(); static; inline;
    class procedure TheFirstParameterAcceptsAnEmptyTArrayOfT(); static; inline;
    class procedure TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT(); static; inline;
  end;

  CategorizeRoutine_ResultCount<T> = record
  private
    class procedure GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut(); static; inline;
    class procedure GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut(); static; inline;
    class procedure GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut(); static; inline;
  end;

  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> = record
  private
    //BucketIn<T> :: SingleDefaultBucketIn, SingleNonDefaultNameBucketIn, MultipleDefaultBucketIn, MultipleNonDefaultNameBucketIn_AllNamesEqual, MultipleNonDefaultNameBucketIn_AllNamesDistinct
    //DataStreams<T> :: EmptyDataStream, SingleDefaultTElement, MultipleDefaultTElements

  //class procedure WhenGiven AnEmptyDataStream And SingleDefaultBucketIn (); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements(); static; inline;
  end;

  CategorizeRoutine_BucketsOutArray_ResultOrder<T> = record

  end;

implementation

{ CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> }

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
begin
  Assert(System.Default(BucketIn<T>).Name = Routines.Categorize<T>([], [System.Default(BucketIn<T>)])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
begin
  var NonDefaultNameBucketIn: BucketIn<T>;
  NonDefaultNameBucketIn.Name := 'a';
  Assert(NonDefaultNameBucketIn.Name = Routines.Categorize<T>([], [NonDefaultNameBucketIn])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();
begin
  Assert(TArray<BucketOut>.Create() = Routines.Categorize<T>(TArray<T>.Create(), TArray<BucketIn<T>>.Create()));
end;

class procedure CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
begin
  Routines.Categorize<T>(TArray<T>.Create(), []);
end;

class procedure CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
begin
  Routines.Categorize<T>([], TArray<BucketIn<T>>.Create());
end;

class procedure CategorizeRoutine_ResultCount<T>.GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([], [System.Default(BucketIn<T>)]);
  Assert(1 = Length(Actual));
  Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([Default(T)], [System.Default(BucketIn<T>)]);
  Assert(1 = Length(Actual));
  Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure CategorizeRoutine_ResultCount<T>.GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
begin
  var Actual: TArray<BucketOut>;
  Actual := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>)]);
  Assert(1 = Length(Actual));
  Assert(System.Default(BucketOut) = Actual[Low(Actual)]);
end;

class procedure DomainTests<T>.Exercise();
begin
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
  CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
  CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
  CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
end;

end.
