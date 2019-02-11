pageextension 50110 "Customer Card Ext. [CC]" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("Ext. [CC]")
            {
                Caption = 'Address from Extension';
                field("New Address"; "New Address")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}