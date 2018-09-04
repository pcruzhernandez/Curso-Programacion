pageextension 50130 ExtendSalesOrderList extends "Sales Order List"
{
    
    actions
    {
        addfirst("&Print")
        {
            action(PrintSimpleDocument)
            { 
                ApplicationArea=All;
                CaptionML=ENU='Simple Document';
                Image=Print;
                Promoted=true;
                PromotedIsBig=true;
                PromotedCategory=Process;
                
                trigger OnAction()
                var
                    rep : Report SimpleDocument;
                    recFilter : Record "Sales Header";
                begin
                    recFilter.SetRange("No.",rec."No.");
                    rep.SetTableView(recFilter);
                    rep.RunModal();
                end;
                

            }
        }
    }
    
}