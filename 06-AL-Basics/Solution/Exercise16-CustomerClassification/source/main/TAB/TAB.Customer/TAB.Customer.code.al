codeunit 80100 "CCO T Customer +"
{
    procedure SuggestSalutation(Rec: Record Customer)
    var
        SalutationTxt: Text;
        Handled: Boolean;
        SuggestedSalutationTxt: TextConst ENU = 'Suggested Salutation:\%1',
                                          DEU = 'Vorgeschlagene Anrede:\%1';
    begin
        Handled := true;
        case true of
            Rec."CCO Classification" = Rec."CCO Classification"::None:
                SalutationTxt := 'Hallo %1';
            Rec."CCO Classification" = Rec."CCO Classification"::Bronze:
                SalutationTxt := 'Dear bronze %1';
            Rec."CCO Classification" = Rec."CCO Classification"::Silver:
                SalutationTxt := 'Dear silver %1';
            Rec."CCO Classification" = Rec."CCO Classification"::Gold:
                SalutationTxt := 'Dear most revered gold %1';
            else begin
                    Handled := false;
                    InvokeOnCreateSalutation(Rec, SalutationTxt, Handled);
                end;
        end;
        IF Handled then
            Message(STRSUBSTNO(SuggestedSalutationTxt, STRSUBSTNO(SalutationTxt, Rec.Name)))
        else
            Error('Impossible to suggest Salutation');
    end;

    local procedure InvokeOnCreateSalutation(var Rec: Record Customer; var SalutationTxt: Text; var Handled: Boolean)
    begin
        // Event publisher could be located here, too, but was implemented within the "Customer" (agent) table 
        Rec.CCOOnCreateSalutation(Rec, SalutationTxt, Handled);
    end;
}