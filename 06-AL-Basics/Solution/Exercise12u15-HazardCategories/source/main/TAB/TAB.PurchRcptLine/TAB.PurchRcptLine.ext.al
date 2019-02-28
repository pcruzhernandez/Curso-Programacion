tableextension 60304 "CCO Purch. Rcpt. Line +" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(60300; "CCO Hazard Category Code"; Code[20])
        {
            CaptionML = ENU = 'Hazard Category Code',
                        DEU = 'Gefahrgutklassencode';
            DataClassification = ToBeClassified;
            TableRelation = "CCO Hazard Category".Code;
        }
    }
}