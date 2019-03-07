pageextension 60301 "CCO Item Ledger Entries +" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("CCO Hazard Category Code"; "CCO Hazard Category Code")
            {
                ApplicationArea = All;
            }
        }
    }
}