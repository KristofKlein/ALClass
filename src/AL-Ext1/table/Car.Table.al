table 50100 Car
{
    DataClassification = ToBeClassified;
    DrillDownPageId = CarList;
    LookupPageId = CarList;
    fields
    {
        field(1; CarID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Manufacturer; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Color; Enum Color)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; CarID)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Rec.CarID := 0;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}