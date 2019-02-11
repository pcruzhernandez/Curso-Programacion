pageextension 50115 "Customer Ext. [CORE]" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("[CORE]")
            {
                field("Custom Data [CORE]"; "Custom Data [CORE]")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}