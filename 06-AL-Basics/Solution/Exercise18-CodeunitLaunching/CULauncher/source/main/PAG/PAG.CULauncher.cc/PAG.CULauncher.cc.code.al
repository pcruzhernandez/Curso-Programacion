codeunit 90000 "CCO CU Launcher"
{
    trigger OnRun()
    begin

    end;

    procedure HandleOnActionLaunchCUTrigger(CUID: Integer; HideDialog: Boolean)
    begin
        LaunchCU(CUID, HideDialog);
    end;

    local procedure LaunchCU(CUID: Integer; HideDialog: Boolean)
    begin
        if not HideDialog then
            if not Confirm('Run CU %1', true, CUID) then begin
                Message('CU Launching aborted');
                exit;
            end;
        Codeunit.Run(CUID);
    end;
}