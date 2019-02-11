page 50115 "App Information List [CORE]"
{

    PageType = List;
    SourceTable = "App Information [CORE]";
    Caption = 'App Information List';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Created; Created) { ApplicationArea = All; }
                field("Application Name"; "Application Name") { ApplicationArea = All; }
                field("App Version"; "App Version") { ApplicationArea = All; }
                field("Data Version"; "Data Version") { ApplicationArea = All; }
            }
        }
    }

}
