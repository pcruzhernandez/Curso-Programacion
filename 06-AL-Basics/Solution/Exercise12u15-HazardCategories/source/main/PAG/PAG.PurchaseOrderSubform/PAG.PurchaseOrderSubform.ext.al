pageextension 60303 "CCO Purchase Order Subform +" extends "Purchase Order Subform"
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