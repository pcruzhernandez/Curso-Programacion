codeunit 50130 Testsubst
{
    trigger OnRun()
    begin
        
    end;
    
[EventSubscriber(ObjectType::Codeunit, Codeunit::Manag, 'OnSomeEvent', 'ElementName', SkipOnMissingLicense, SkipOnMissingPermission)]
local procedure MyProcedure()
begin
    
end;

    var
        myInt: Integer;
}