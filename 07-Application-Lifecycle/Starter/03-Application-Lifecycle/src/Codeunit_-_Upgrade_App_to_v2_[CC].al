codeunit 50112 "Upgrade App to v2 [CC]"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        If not CheckIfInstallingAppVersionCompatibleWithInstalledVersion() then
            exit;

        PopulateNewAddressField();
    end;

    local procedure CheckIfInstallingAppVersionCompatibleWithInstalledVersion(): Boolean
    begin
        Exit((GetInstallingVersionNo() = '2.0.0.0') and (GetCurrentlyInstalledVersionNo() = '1.0.0.0'));
    end;

    procedure GetInstallingVersionNo(): Text
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(FORMAT(AppInfo.AppVersion()));
    end;

    procedure GetCurrentlyInstalledVersionNo(): Text
    var
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);
        exit(FORMAT(AppInfo.DataVersion()));
    end;

    local procedure PopulateNewAddressField()
    var
        Customer: Record Customer;
    begin
        With Customer do begin
            if FindSet() then
                repeat
                    "New Address" := 'some value';
                    Modify;
                until next = 0;
        end;
    end;
}