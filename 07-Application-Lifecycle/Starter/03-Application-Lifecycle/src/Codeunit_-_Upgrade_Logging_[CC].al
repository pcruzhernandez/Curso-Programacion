codeunit 50111 "Upgrade Logging [CC]"
{
    Subtype = Upgrade;

    trigger OnCheckPreconditionsPerDatabase()
    begin
        AddMessageToOurTable('OnCheckPreconditionsPerDatabase');
    end;

    trigger OnCheckPreconditionsPerCompany()
    begin
        AddMessageToOurTable('OnCheckPreconditionsPerCompany');
    end;

    trigger OnUpgradePerDatabase()
    begin
        AddMessageToOurTable('OnUpgradePerDatabase');
    end;

    trigger OnUpgradePerCompany()
    begin
        AddMessageToOurTable('OnUpgradePerCompany');
    end;

    trigger OnValidateUpgradePerDatabase()
    begin
        AddMessageToOurTable('OnValidateUpgradePerDatabase');
    end;

    trigger OnValidateUpgradePerCompany()
    begin
        AddMessageToOurTable('OnValidateUpgradePerCompany');
    end;

    local procedure AddMessageToOurTable(MessageFromTrigger: Text)
    var
        CheckInstallProcess: Record "Install Process Details [CC]";
    begin
        CheckInstallProcess.InsertRecord(MessageFromTrigger);
    end;
}
