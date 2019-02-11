page 50101 "Beer Category Card [CC]"
{
    PageType = Card;
    SourceTable = "Beer Category [CC]";
    SourceTableView = sorting (Code) order(ascending);
    CaptionML = ENU = 'Beer Category Card',
                      DEU = 'Bier Kategorie Karte';
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field("Description"; "Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
