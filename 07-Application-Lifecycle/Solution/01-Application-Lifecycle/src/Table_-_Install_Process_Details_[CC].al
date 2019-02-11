table 50110 "Install Process Details [CC]"
{
    DataPerCompany = false;
    fields
    {
        field(1; "Primary Key"; Integer) { AutoIncrement = true; }
        field(2; "Trigger"; Text[250]) { }
        field(3; "Version Installing"; Text[250]) { }
        field(4; "Company Name"; Text[250]) { }
        field(5; "Version Installed"; Text[250]) { }
        field(6; "Installation Time"; DateTime) { }
    }
    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }

    procedure InsertRecord(MessageFromTrigger: Text)
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        Init();
        "Trigger" := MessageFromTrigger;
        "Company Name" := CompanyName();
        "Version Installing" := Format(AppInfo.AppVersion());
        "Version Installed" := Format(AppInfo.DataVersion());
        "Installation Time" := CreateDateTime(Today(), Time());
        Insert();
    end;
}

