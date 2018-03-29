page 50200 "Beer Category List [CC]"
{
    PageType        = List;
    SourceTable     = "Beer Category [CC]";
    SourceTableView = order(ascending);
    CaptionML       = ENU = 'Beer Category List', DEU = 'Bier Kategorien Liste';
    ApplicationArea = All;
    UsageCategory   = Lists;
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
