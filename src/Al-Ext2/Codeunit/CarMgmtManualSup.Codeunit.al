/// <summary>
/// Example Codeunit for a manual Subscriber implemenation
/// </summary>
codeunit 50103 CarMgmtManualSup
{
    EventSubscriberInstance = Manual;
    SingleInstance = true;

    ///<summary>
    /// subscriber to a Page Event
    /// </summary>
    [EventSubscriber(ObjectType::Page, Page::CarList, 'OnAfterActionEvent', 'Count', false, true)]
    local procedure DeveloperInfo()
    begin
        Message('This Button is stupid!');
    end;
}