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
    actions
    {
        addafter(Count)
        {
            action(AvgSpeed)
            {
                ApplicationArea = All;
                ToolTip = 'return the Avg. Speed of all Cars';
                Image = Delivery;

                trigger OnAction()
                var
                    CarMgmt: Codeunit CarMgmtExt;
                begin
                    Message('Avg. Speed of all Cars is: %1', CarMgmt.needforspeed());
                end;
            }
        }
    }
}
