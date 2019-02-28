tableextension 60303 "CCO Purchase Line +" extends "Purchase Line"
{
    fields
    {
        field(60300; "CCO Hazard Category Code"; Code[20])
        {
            CaptionML = ENU = 'Hazard Category Code',
                      DEU = 'Gefahrgutklassencode';
            DataClassification = ToBeClassified;
            TableRelation = "CCO Hazard Category".Code;
            trigger OnValidate()
            begin
                ObjectCU.CheckIsItemLine(Rec, false);
            end;
        }
    }
    var
        ObjectCU: Codeunit "CCO T Purchase Line +";

    procedure CheckIsItemLine(Rec: Record "Purchase Line"; HideError: Boolean): Boolean
    begin
        ObjectCU.CheckIsItemLine(Rec, HideError);
    end;
}