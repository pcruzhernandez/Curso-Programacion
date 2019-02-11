codeunit 50110 "Install Logging [CC]"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    begin
        AddMessageToOurTable('OnInstallAppPerDatabase');
    end;

    trigger OnInstallAppPerCompany()
    begin
        AddMessageToOurTable('OnInstallAppPerCompany');
    end;

    local procedure AddMessageToOurTable(MessageFromTrigger: Text)
    var
        CheckInstallProcess: Record "Install Process Details [CC]";
    begin
        CheckInstallProcess.InsertRecord(MessageFromTrigger);
    end;
}
