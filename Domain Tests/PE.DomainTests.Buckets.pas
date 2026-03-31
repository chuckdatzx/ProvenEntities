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
  private {Empty Data Stream}
    class procedure WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
    class procedure WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
  private {Multiple Default Data Stream Elements}
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames(); static; inline;
    class procedure WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames(); static; inline;
  end;

  CategorizeRoutine_BucketsOutArray_ResultOrder<T> = record
  end;

implementation

{ CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T> }

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(System.Default(BucketIn<T>).Name = Routines.Categorize<T>([], [System.Default(BucketIn<T>)])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
begin
  System.Assert('a' = Routines.Categorize<T>([], [BucketIn<T>.Create(nil, 'a')])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames;
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a')]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert('a' = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  Assert(3 = Length(Actual));
  Assert('1' = Actual[Low(Actual)].Name);
  Assert('2' = Actual[Low(Actual) + 1].Name);
  Assert('3' = Actual[Low(Actual) + 2].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn();
begin
  System.Assert(System.Default(BucketIn<T>).Name = Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>)])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn();
begin
  System.Assert('a' = Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, 'a')])[0].Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [System.Default(BucketIn<T>), System.Default(BucketIn<T>), System.Default(BucketIn<T>)]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert(System.Default(BucketIn<T>).Name = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a'), BucketIn<T>.Create(nil, 'a')]);
  Assert(3 = Length(Actual));
  var Each: BucketOut;
  for Each in Actual do
    Assert('a' = Each.Name);
end;

class procedure CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();
begin
  var Actual: TArray<BucketOut> := Routines.Categorize<T>([System.Default(T), System.Default(T), System.Default(T)], [BucketIn<T>.Create(nil, '1'), BucketIn<T>.Create(nil, '2'), BucketIn<T>.Create(nil, '3')]);
  Assert(3 = Length(Actual));
  Assert('1' = Actual[Low(Actual)].Name);
  Assert('2' = Actual[Low(Actual) + 1].Name);
  Assert('3' = Actual[Low(Actual) + 2].Name);
end;

{ CategorizeRoutine_SignatureTests<T> }

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

{ CategorizeRoutine_ResultCount<T> }

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
  CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
  CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
  CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndASingleNonDefaultNameDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleDefaultBucketInElements();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNOnDefaultBucketInElementsAllSharingIdenticalNames();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenAnEmptyDataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();

  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndASingleNonDefaultNameDefaultBucketIn();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleDefaultBucketInElements();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllSharingIdenticalNames();
  CategorizeRoutine_BucketsOutArray_NameIsCopiedFromBucketIn<T>.WhenGivenMultipleDefaultTElementsAsADataStreamAndMultipleNonDefaultBucketInElementsAllWithUniqueNames();

  CategorizeRoutine_ResultCount<T>.GivenAnEmptyDataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenASingleDefaultElementOfTAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
  CategorizeRoutine_ResultCount<T>.GivenMultipleDefaultElementsAsADataStreamAndGiven1DefaultBucketInOfT_Returns1DefaultBucketOut();
end;

end.
