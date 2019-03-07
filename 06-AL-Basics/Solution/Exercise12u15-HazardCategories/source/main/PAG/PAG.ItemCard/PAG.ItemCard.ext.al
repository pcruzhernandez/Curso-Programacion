pageextension 60300 "CCO Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("CCO Hazard Category Code"; "CCO Hazard Category Code")
            {
                ApplicationArea = All;
            }
        }
    }
}