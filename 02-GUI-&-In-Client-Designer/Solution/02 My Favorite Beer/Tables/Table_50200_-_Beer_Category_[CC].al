table 50200 "Beer Category [CC]"
{
    CaptionML = ENU = 'Beer Category',
                DEU = 'Bier Kategorie';

    Description = '[Dev] GUI & In-Client Designer';

    fields
    {
        field(1; Code; Code[20])
        {
            CaptionML = ENU = 'Code',
                        DEU = 'Code';
            NotBlank  = true;
        }

        field(2; Name; Text[50])
        {
            CaptionML = ENU = 'Name',
                        DEU = 'Name';
        }

        field(3; Description; Text[200])
        {
            CaptionML = ENU = 'Description',
                        DEU = 'Beschreibung';
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