tableextension 60301 "CCO Item Journal Line +" extends "Item Journal Line"
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