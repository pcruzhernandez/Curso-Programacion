page 50203 "Beer Category Sub [CC]"
{
    PageType        = ListPart;
    SourceTable     = "Beer Category [CC]";
    SourceTableView = sorting(Code) order(ascending);
    CaptionML       = ENU = 'Beer Category List', 
                      DEU = 'Bier Kategorie Liste';
    CardPageId      = "Beer Category Card [CC]";

    layout
    {
        area(content)
        {
            repeater(General)
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
