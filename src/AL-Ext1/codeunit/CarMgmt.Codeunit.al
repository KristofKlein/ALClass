codeunit 50100 CarMgmt
{
    trigger OnRun()
    begin

    end;

    /// <summary>
    /// Count all Cars - no Filter is used to do so
    /// </summary>
    /// <returns>Returns the amount of Cars in the Car table</returns>
    procedure Counter(): integer;
    var
        CarRec: Record Car;
    begin
        CarRec.Reset();
        Exit(CarRec.Count());
    end;
    /// <summary>
    /// Count all Cars - Filtered by Manufacturer
    /// </summary>
    /// <param name="Manufacturer">Name of the Manufacturer</param>
    /// <returns>Returns the amount of Cars in the Car table filtered on the Manufacturer</returns>
    procedure Counter(Manufacturer: Text[100]): integer;
    var
        CarRec: Record Car;
    begin
        CarRec.Reset();
        IF (Manufacturer = '') then
            Exit(Counter());

        CarRec.SetFilter(CarRec.Manufacturer, '=%1', Manufacturer);
        Exit(CarRec.Count());
    end;

    /// <summary>
    /// Returns the count of Cars in the given Car Record
    /// </summary>
    /// <param name="CarRec">Hand in a CarRec if you want to know how many cars are in that recordvariable</param>
    /// <returns>Returns the amount of Cars in the Record</returns>
    procedure Counter(var CarRec: Record Car): integer;
    begin
        Exit(CarRec.Count());
    end;

}