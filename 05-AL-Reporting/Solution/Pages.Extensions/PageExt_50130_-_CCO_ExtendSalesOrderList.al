pageextension 50130 CCO_ExtendSalesOrderList extends "Sales Order List"
{
    
    actions
    {
        addfirst("&Print")
        {
            action(CCO_PrintSimpleDocument)
            { 
                ApplicationArea=All;
                CaptionML=ENU='Simple Document';
                Image=Print;
                
                trigger OnAction()
                var
                    rep : Report "CCO SimpleDocument";
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