tableextension 80100 "CCO Customer +" extends Customer
{
    fields
    {
        field(80000; "CCO Classification"; enum "CCO Customer Classification")
        {
            CaptionML = ENU = 'Classification',
                        DEU = 'Klassifizierung';
            DataClassification = ToBeClassified;
        }

    }

    [IntegrationEvent(false, false)]
    procedure CCOOnCreateSalutation(var Rec: Record Customer; var SalutationTxt: Text; var Handled: Boolean)
    begin
    end;

    procedure CCOSuggestSalutation(Rec: Record Customer)
    begin
        ObjectCU.SuggestSalutation(Rec);
    end;

    var
        ObjectCU: Codeunit "CCO T Customer +";
}