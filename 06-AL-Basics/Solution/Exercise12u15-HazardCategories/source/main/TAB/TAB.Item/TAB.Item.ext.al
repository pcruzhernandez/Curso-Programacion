tableextension 60300 "CCO Item +" extends Item
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