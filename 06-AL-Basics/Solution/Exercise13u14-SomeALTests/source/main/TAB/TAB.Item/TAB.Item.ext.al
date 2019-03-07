tableextension 70000 "CCO Item +" extends Item //27
{
    fields
    {
        field(70000; "CCO My New Description"; Text[80])
        {
            CaptionML = ENU = 'My new Description',
                        DEU = 'Meine neue Beschreibung';
            DataClassification = CustomerContent;
        }
    }
}