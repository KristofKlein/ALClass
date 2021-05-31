report 50100 CarList
{
    ApplicationArea = All;
    Caption = 'CarList';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = '.\Layouts\CarList.docx';

    dataset
    {
        dataitem(Car; Car)
        {
            column(CarID; CarID)
            {
            }
            column(Color; Color)
            {
            }
            column(Manufacturer; Manufacturer)
            {
            }
            column(Speed; Speed)
            {
            }
            column(Weight; Weight)
            {
            }
            column(SystemId; SystemId)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
