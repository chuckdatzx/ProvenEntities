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

  //Keep in mind Chuck:: we're just looking for surface coverage here (ignore runtime vs. compile-time)

  CategorizeRoutine_ResultCount<T> = record
  strict private
    strict private class var DefaultBucketIn: BucketIn<T>;
  private
    class procedure ReturnsASingleOutBucketWhenGivenAnEmptyDataStreamAndASingleInBucketOfTypeT(); static; inline;
    //class procedure ReturnsASingleOutBucketWhenGivenANonEmptyDataStreamAndASingleInBucketOfTypeT(); static; inline;
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

class procedure CategorizeRoutine_ResultCount<T>.ReturnsASingleOutBucketWhenGivenAnEmptyDataStreamAndASingleInBucketOfTypeT();
begin
//  Assert(1 = Length(Routines.Categorize<T>([], [DefaultBucketIn])));
end;

class procedure DomainTests<T>.Exercise();
begin
  CategorizeRoutine_SignatureTests<T>.TheFirstParameterAcceptsAnEmptyTArrayOfT();
  CategorizeRoutine_SignatureTests<T>.TheSecondParameterAcceptsAnEmptyTArrayOfBucketInOfT();
  CategorizeRoutine_SignatureTests<T>.ReturnsAnEmptyArrayOfBucketOut();

  CategorizeRoutine_ResultCount<T>.ReturnsASingleOutBucketWhenGivenAnEmptyDataStreamAndASingleInBucketOfTypeT();
end;

end.
