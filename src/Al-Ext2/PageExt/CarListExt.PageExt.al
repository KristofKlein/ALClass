/// <summary>
/// Page Extension https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-page-ext-object
/// </summary>
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

    /// <summary>
    /// Demonstrate the Usage of Manual Sbuscriber
    /// </summary>
    trigger OnAfterGetCurrRecord()
    var
        CarMgmtManualSup: Codeunit CarMgmtManualSup;
    begin
        if (Rec.CarID MOD 2 = 0) then
            BindSubscription(CarMgmtManualSup)
        else
            UnbindSubscription(CarMgmtManualSup);


    end;
}
