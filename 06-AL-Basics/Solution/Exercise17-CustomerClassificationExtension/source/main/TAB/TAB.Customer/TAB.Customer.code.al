codeunit 80300 "CCO T Customer ++"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'CCOOnCreateSalutation', '', false, false)]
    local procedure HandleCCOOnCreateSalutation(var Rec: Record Customer; var SalutationTxt: Text; var Handled: Boolean)
    begin
        SuggestPlatinumSalutation(Rec, SalutationTxt, Handled);
    end;

    procedure SuggestPlatinumSalutation(var Rec: Record Customer; var SalutationTxt: Text; var Handled: Boolean)
    begin
        Handled := true;
        if Rec."CCO Classification" = Rec."CCO Classification"::CCOPlatinum then
            SalutationTxt := 'Hallo supreme most revered %1'
        else
            Handled := false;
    end;
}