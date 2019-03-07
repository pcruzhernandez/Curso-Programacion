codeunit 60100 "CCO T Unit of Measure +"
{
    [EventSubscriber(ObjectType::Table, Database::"Unit of Measure", 'OnBeforeValidateEvent', 'Description', false, false)]
    local procedure HandleOnBeforeValidate()
    begin
        LaunchConfirm('OnBeforeValidate Event');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Unit of Measure", 'OnAfterValidateEvent', 'Description', false, false)]
    local procedure HandleOnAfterValidate()
    begin
        LaunchConfirm('OnAfterValidate Event');
    end;

    procedure LaunchConfirm(ConfirmText: Text)
    begin
        if not Confirm(ConfirmText, true) then
            Error('Error after "%1"', ConfirmText);
    end;
}