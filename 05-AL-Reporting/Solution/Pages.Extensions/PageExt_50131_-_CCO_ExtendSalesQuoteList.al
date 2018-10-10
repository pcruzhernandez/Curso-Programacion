pageextension 50131 CCO_ExtendSalesQuoteList extends "Sales Quotes"
{
    
    actions
    {
        addfirst("&Quote") 
        {
            action(CCO_PrintSimpleDocument)
            { 
                ApplicationArea=All;
                CaptionML=ENU='Simple Document';
                Image=Print;
                
                trigger OnAction()
                var
                    rep : Report "CCO SimpleDocumentQuote";
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