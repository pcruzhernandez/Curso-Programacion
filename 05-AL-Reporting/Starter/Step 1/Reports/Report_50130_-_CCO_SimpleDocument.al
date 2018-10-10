report 50130 "CCO SimpleDocument"
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
            RequestFilterFields="No.";
            column(No_;"No.")
            {
                
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
                
            }
            column(Sell_to_Address;"Sell-to Address")
            {

            }
            column(Sell_to_Post_Code;"Sell-to Post Code")
            {

            }
            column(Sell_to_City;"Sell-to City")
            {

            }
            column(TextOrderNo; TextOrderNo)
            {

            }

        }
    }
    

    var
        TextOrderNo : TextConst ENU='Order No.',DEA='Auftragsnr.';

}