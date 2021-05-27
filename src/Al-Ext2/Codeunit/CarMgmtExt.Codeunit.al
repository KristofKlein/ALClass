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
            exit(SumSpeed / Counter);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalcNeedForSpeed(var Cars: Record Car; var Handled: Boolean)
    begin
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::CarMgmtExt, 'OnBeforeCalcNeedForSpeed', '', false, false)]
    local procedure _OnBeforeCalcNeedForSpeed(var Cars: Record Car; var Handled: Boolean);
    begin
        Cars.SetFilter(Cars.Speed, '>%1', 0);
    end;

}
