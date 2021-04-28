page 50100 CarList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Car;

    layout
    {
        area(Content)
        {
            repeater(Default)
            {
                field(CarID; Rec.CarID)
                {
                    ApplicationArea = All;
                    ToolTip = 'This is the Car ID in our Database';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                    ToolTip = 'This field indicates the Manufacurer of the Car';
                }
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field';
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Count")
            {
                ApplicationArea = All;
                ToolTip = 'This action will count the amount of Records in the Car table.';
                Image = NumberGroup;

                trigger OnAction()
                var
                    CarMgmt: Codeunit CarMgmt;
                    CarsInTableLbl: Label 'You have %1 Cars in the list.', Comment = '%1 gets replaced with Car.Count', Locked = false;
                begin
                    Message(CarsInTableLbl, CarMgmt.Counter());
                end;
            }
        }
    }

}