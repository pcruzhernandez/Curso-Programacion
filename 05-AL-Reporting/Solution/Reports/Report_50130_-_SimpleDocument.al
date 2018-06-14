report 50130 SimpleDocument
{
    CaptionML=ENU='Simple Document';
    Description='A simple document';
    PreviewMode=PrintLayout;
    UsageCategory=Documents;
    ApplicationArea=All;
    RDLCLayout='.\Reports\Layout\50130_SimpleDocument.rdl';

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            PrintOnlyIfDetail=true;
            RequestFilterFields="No.";
            column(No_;"No.")
            {
                
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
                
            }
            column(Sell_to_Customer_Name_2;"Sell-to Customer Name 2")
            {

            }
            column(TextOrderNo; TextOrderNo)
            {

            }
            dataitem(SalesLine;"Sales Line")
            {
                DataItemLink="Document No."=Field("No.");
                column(SalesLine_No_;"No.")
                {

                }
            }
        }
    }
    
    
    var
        TextOrderNo : TextConst ENU='Order No.';
}