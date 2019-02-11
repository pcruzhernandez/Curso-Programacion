table 50115 "App Information [CORE]"
{
    DataPerCompany = false;
    fields
    {
        field(1; "Primary Key"; Integer) { AutoIncrement = true; }
        field(2; "Application Name"; Text[250]) { }
        field(3; "App Version"; Text[250]) { }
        field(4; "Data Version"; Text[250]) { }
        field(5; Created; DateTime) { }
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
        "Application Name" := AppInfo.Name();
        "App Version" := Format(AppInfo.AppVersion());
        "Data Version" := Format(AppInfo.DataVersion());
        "Created" := CreateDateTime(Today(), Time());
        Insert();
    end;
}

