/// <summary>
/// Table Extension https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-table-ext-object
/// </summary>
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
