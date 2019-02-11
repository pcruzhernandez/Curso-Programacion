page 50102 "Beer Category List [CC]"
{
    PageType = List;
    SourceTable = "Beer Category [CC]";
    SourceTableView = sorting (Code) order(ascending);
    CaptionML = ENU = 'Beer Category List',
                      DEU = 'Bier Kategorie Liste';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Beer Category Card [CC]";

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
