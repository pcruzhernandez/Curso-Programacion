pageextension 60302 "CCO Posted Purch. Rcpt. Sub. +" extends "Posted Purchase Rcpt. Subform"
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