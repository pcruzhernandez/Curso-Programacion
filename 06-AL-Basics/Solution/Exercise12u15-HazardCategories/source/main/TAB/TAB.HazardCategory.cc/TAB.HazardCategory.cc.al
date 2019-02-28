table 60300 "CCO Hazard Category"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "CCO Hazard Categories";
    LookupPageId = "CCO Hazard Categories";

    fields
    {
        field(1; Code; Code[20])
        {
            CaptionML = ENU = 'Code',
                        DEU = 'Code';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(10; "Description"; Text[80])
        {
            CaptionML = ENU = 'Description',
                        DEU = 'Beschreibung';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}