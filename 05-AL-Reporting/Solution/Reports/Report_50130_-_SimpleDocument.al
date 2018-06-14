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
            column(TextNo;TextNo)
            {

            }
            column(TextDesc;TextDesc)
            {
            }
            column(TextQuantity;TextQuantity)
            {

            }
            column(TextUnitOfMeassure;TextUnitOfMeassure)
            {
            }
            column(TextSalesAmount;TextSalesAmount)
            {

            }
            column(TextTotal;TextTotal)
            {

            }

            dataitem(SalesLine;"Sales Line")
            {
                DataItemLink="Document No."=Field("No.");
                column(SalesLine_No_;"No.")
                {
                    
                }
                column(Description;Description)
                {
                    IncludeCaption=true;
                }
                column(Quantity;Quantity)
                {
                    IncludeCaption=true;                    
                }
                column(Unit_of_Measure;"Unit of Measure")
                {
                    IncludeCaption=true;
                }
                column(Line_Amount;"Line Amount")
                {

                }
                column(sumAmount;sumAmount)
                {

                }

                trigger OnAfterGetRecord()
                begin
                    sumAmount += sumAmount; 
                end;
            }
            
            trigger OnPreDataItem()
            begin
                sumAmount := 0;
            end;
        }
    }
    

    var

        sumAmount : Decimal;
        TextOrderNo : TextConst ENU='Order No.',DEA='Auftragsnr.';
        TextNo : TextConst ENU='Item No.',DEA='Artikelnr.';
        TextDesc : TextConst ENU='Description',DEA='Beschreibung';
        TextQuantity : TextConst ENU='Quantity',DEA='Menge';
        TextUnitOfMeassure : TextConst ENU='Unit',DEA='Einheit';
        TextSalesAmount : TextConst ENU='Amount',DEA='Betrag';
        TextTotal : TextConst ENU='Total',DEA='Gesamt';

}