tableextension 50100 CarDetails extends Car
{
    fields
    {
        field(50100; Speed; Integer)
        {
            DataClassification = ToBeClassified;
            InitValue = 0;
        }
        field(50101; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
