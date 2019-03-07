pageextension 80100 "CCO Customer Card +" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CCO Classification"; "CCO Classification")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst("&Customer")
        {
            action(SuggestSalutation)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ObjectCU.HandleOnActionSuggestSalutationTrigger(Rec);
                end;
            }
        }
    }
    var
        ObjectCU: Codeunit "CCO P Customer Card +";
}