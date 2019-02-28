tableextension 60302 "CCO Item Ledger Entry +" extends "Item Ledger Entry"
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