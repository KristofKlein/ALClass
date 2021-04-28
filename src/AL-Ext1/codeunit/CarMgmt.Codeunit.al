codeunit 50100 CarMgmt
{
    trigger OnRun()
    begin

    end;

    procedure Count(): integer;
    var
        CarRec: Record Car;
    begin
        CarRec.Reset();
        Exit(CarRec.Count());
    end;

}