pageextension 50200 CarDetailsList extends CarList
{
    layout
    {
        addlast(Content)
        {
            field(Speed; Rec.Speed)
            {
                AboutText = 'Here you can enter the max Speed in km/h';
            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}