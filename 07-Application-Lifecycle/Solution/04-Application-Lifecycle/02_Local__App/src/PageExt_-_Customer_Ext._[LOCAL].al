pageextension 50120 "Customer Ext. [LOCAL]" extends "Customer Card"
{
    layout
    {
        addafter("Custom Data [CORE]")
        {
            field("Custom Data [LOCAL]"; "Custom Data [LOCAL]")
            {
                ApplicationArea = All;
            }

        }
    }
}