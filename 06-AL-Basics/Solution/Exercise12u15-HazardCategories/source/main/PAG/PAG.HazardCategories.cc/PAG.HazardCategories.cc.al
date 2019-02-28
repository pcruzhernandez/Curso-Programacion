page 60300 "CCO Hazard Categories"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "CCO Hazard Category";
    UsageCategory = Lists;
    CaptionML = ENU = 'Hazard Categories',
                DEU = 'Gefahrgutklassen';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}