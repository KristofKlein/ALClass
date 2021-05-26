tableextension 50200 CarDetails extends Car
{
    fields
    {
        field(50200; Speed; Integer)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
        }
        field(50201; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}