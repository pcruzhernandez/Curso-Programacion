pageextension 50121 "App Information List [LOCAL]" extends "App Information List [CORE]"
{
    layout
    {
        addafter("Data Version")
        {
            field("Custom Data [LOCAL]"; "Custom Data [LOCAL]")
            {
                ApplicationArea = All;
            }
        }
    }
}