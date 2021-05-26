codeunit 50101 Car
{
    trigger OnRun()
    begin
        myCar.Color := myCar.Color::royalblue;
        myCar.Manufacturer := 'SUBARU';
        myCar.Speed := 250;
        myCar.Weight := 1.400;
    end;

    var
        myCar: Record Car;
}
