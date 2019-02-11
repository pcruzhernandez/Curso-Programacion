page 50110 "Install Process Details [CC]"
{

    PageType = List;
    SourceTable = "Install Process Details [CC]";
    Caption = 'Install Process Details List';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Installation Time"; "Installation Time")
                {
                    ApplicationArea = All;
                }
                field("Company Name"; "Company Name")
                {
                    ApplicationArea = All;
                }
                field("Trigger"; "Trigger")
                {
                    ApplicationArea = All;
                }

                field("Version Installing"; "Version Installing")
                {
                    ApplicationArea = All;
                }

                field("Version Installed"; "Version Installed")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
