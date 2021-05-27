codeunit 50101 CarMgmtExt
{
    trigger OnRun()
    begin
        addSubaru();
    end;


    local procedure addSubaru()
    var
        myCar: Record Car;
    begin
        myCar.init();
        myCar.Color := myCar.Color::royalblue;
        myCar.Manufacturer := 'SUBARU';
        myCar.Speed := 250;
        myCar.Weight := 1.400;
        myCar.Insert(true);
    end;

    /// <summary>
    /// Usage of Partial Loading : https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-partial-records
    /// </summary>
    /// <returns>the Avg. Speed of all cars</returns>
    procedure needforspeed(): Decimal;
    var
        Cars: Record Car;
        SumSpeed: BigInteger;
        Counter: BigInteger;
        Handled: Boolean;
    begin
        OnBeforeCalcNeedForSpeed(Cars, Handled);
        Cars.SetLoadFields(Cars.Speed);
        IF Cars.FIndset() then begin
            repeat
                SumSpeed += Cars.Speed;
                Counter += 1;
            until Cars.Next() = 0;
            OnAfterCalcNeedForSpeed(Cars);
            exit(SumSpeed / Counter);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalcNeedForSpeed(var Cars: Record Car; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalcNeedForSpeed(Cars: Record Car)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::CarMgmtExt, 'OnBeforeCalcNeedForSpeed', '', false, false)]
    local procedure _OnBeforeCalcNeedForSpeed(var Cars: Record Car; var Handled: Boolean);
    begin
        Cars.SetFilter(Cars.Speed, '>%1', 0);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::CarMgmtExt, 'OnAfterCalcNeedForSpeed', '', false, false)]
    local procedure _OnAfterCalcNeedForSpeed(Cars: Record Car);
    begin
    end;

    /// <summary>
    /// Subscriber for a Table Event - use Snippet to create them https://www.kauffmann.nl/2018/03/24/table-trigger-events-in-dynamics-365-business-central/
    /// </summary>
    /// <param name="RunTrigger">if the Deletion was called with true or false</param>
    /// <param name="Rec">the record to delete</param>
    [EventSubscriber(ObjectType::Table, Database::Car, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure ConfirmDeleteCarEntry(var Rec: Record Car; RunTrigger: Boolean)
    begin
        IF NOT Rec.IsTemporary() then
            IF NOT Confirm('Are you sure sure? %1', false, Rec.CarID) then
                ERROR('');
    end;

    /// <summary>
    /// subsciber to a global Event https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-event-types
    /// </summary>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnAfterCompanyOpen', '', false, false)]
    local procedure OnAfterCompanyOpen();
    begin
        Message('あなたは地獄のように元気に見えます');
    end;

    ///<summary>
    /// subscriber to a Page Event
    /// </summary>
    [EventSubscriber(ObjectType::Page, Page::CarList, 'OnAfterActionEvent', 'Count', false, true)]
    local procedure MyProcedure()
    begin
        Message('stop that button!');
    end;
}