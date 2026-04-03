unit CategorizingWithBuckets;

interface

uses
  {PE}
  PE.Buckets,
  PE.Types;

type
  TCustomEnumeratedType = (cetSour, cetSweet, cetFuzzy);
const
  MyCandyDish: ArrayOf<TCustomEnumeratedType> = [cetSour, cetSweet, cetFuzzy, cetSour, cetSweet];

type
  Exercise = record
  public class procedure AllTests(); static;
  end;

  OrganizingCustomEnumeratedTypes = record
  strict private type BucketInCustomEnumType = BucketIn<TCustomEnumeratedType>;
  public
    class procedure IsLikeTellingARobotHowToSortACandyDish(); static;
  end;

  OrganizingNumbers = record
  strict private type BucketIn_NaturalNumber = BucketIn<NaturalNumber>;
  strict private const SomeCollectionOfNaturalNumbers: NaturalNumberArray = [1, 2, 3, 4, 5, 6, 7];
  public
    class procedure ByCherryPicking(); static;
    class procedure ByOddsAndEvens(); static;
  end;

implementation

{ OrganizingNumbers }

class procedure OrganizingNumbers.ByCherryPicking;
var
  Actual: ArrayOf<BucketOut>;
begin
  Actual := Routines.Categorize<NaturalNumber>(SomeCollectionOfNaturalNumbers,
    [BucketIn_NaturalNumber.Create(function (const AValue: NaturalNumber): Boolean begin Result := (AValue = 1); end, '1s'),
     BucketIn_NaturalNumber.Create(function (const AValue: NaturalNumber): Boolean begin Result := (AValue = 2); end, '2s')]);
  System.Assert(2 = System.Length(Actual));
  System.Assert('1s' = Actual[System.Low(Actual)].Name);
  System.Assert('2s' = Actual[System.Low(Actual) + 1].Name);
  System.Assert(1 = Actual[System.Low(Actual)].Count);
  System.Assert(1 = Actual[System.Low(Actual) + 1].Count);
end;

class procedure OrganizingNumbers.ByOddsAndEvens();
var
  Actual: ArrayOf<BucketOut>;
begin
  Actual := Routines.Categorize<NaturalNumber>(SomeCollectionOfNaturalNumbers,
    [BucketIn_NaturalNumber.Create(function (const AValue: NaturalNumber): Boolean begin Result := ((AValue mod 2) = 0); end, 'Even'),
     BucketIn_NaturalNumber.Create(function (const AValue: NaturalNumber): Boolean begin Result := ((AValue mod 2) <> 0); end, 'Odd')]);
  System.Assert(2 = System.Length(Actual));
  System.Assert('Even' = Actual[System.Low(Actual)].Name);
  System.Assert('Odd' = Actual[System.Low(Actual) + 1].Name);
  System.Assert(3 = Actual[System.Low(Actual)].Count);
  System.Assert(4 = Actual[System.Low(Actual) + 1].Count);
end;

{ Exercise }

class procedure Exercise.AllTests;
begin
  OrganizingNumbers.ByCherryPicking();
  OrganizingNumbers.ByOddsAndEvens();
  OrganizingCustomEnumeratedTypes.IsLikeTellingARobotHowToSortACandyDish();
end;

{ OrganizingCustomEnumeratedTypes }

class procedure OrganizingCustomEnumeratedTypes.IsLikeTellingARobotHowToSortACandyDish;
var
  Actual: ArrayOf<BucketOut>;
begin
  //Asking: "How many of my favorites does this candy dish have?"
  Actual := Routines.Categorize<TCustomEnumeratedType>(MyCandyDish,
    [BucketInCustomEnumType.Create(function (const AValue: TCustomEnumeratedType): Boolean begin Result := (AValue = cetSweet); end, 'Favorites')]);
  //Proving the answer is as expected
  System.Assert(1 = System.Length(Actual));
  System.Assert('Favorites' = Actual[System.Low(Actual)].Name);
  System.Assert(Actual[System.Low(Actual)].Count = 2);

  //Asking: "How many candies were snuck back into the dish (i.e. found under the couch cushions)?"
  Actual := Routines.Categorize<TCustomEnumeratedType>(MyCandyDish,
    [BucketInCustomEnumType.Create(function (const AValue: TCustomEnumeratedType): Boolean begin Result := (AValue = cetFuzzy); end, '>5SecondRule')]);
  //Proving the answer is as expected
  System.Assert(1 = System.Length(Actual));
  System.Assert('>5SecondRule' = Actual[System.Low(Actual)].Name);
  System.Assert(Actual[System.Low(Actual)].Count = 1);
end;

end.
