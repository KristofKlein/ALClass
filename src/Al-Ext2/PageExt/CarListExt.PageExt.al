pageextension 50100 CarListExt extends CarList
{
    layout
    {
        addafter(Color)
        {
            field(Speed; Rec.Speed)
            {
                ApplicationArea = All;
                ToolTip = 'Top Speed';
            }
            field(Weight; Rec.Weight)
            {
                ApplicationArea = All;
                ToolTip = 'Max Weight';
            }
        }
    }
}
