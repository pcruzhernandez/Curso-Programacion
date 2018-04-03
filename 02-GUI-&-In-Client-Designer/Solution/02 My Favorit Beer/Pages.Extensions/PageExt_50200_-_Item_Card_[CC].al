pageextension 50200 "Item Card [CC]" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group("Beer")
            {
                field("Beer Item [CC]";"Beer Item [CC]") 
                {
                    ApplicationArea = All;
                }

                group("Beer Category Group")
                {
                    Visible     = "Beer Item [CC]";
                    ShowCaption = false;

                    field("Beer Category Code [CC]"; "Beer Category Code [CC]")
                    {
                        ApplicationArea = All;                        
                    }
                }

                group("Beer Category Name Group")
                {
                    Visible     = "Beer Item [CC]";
                    ShowCaption = false;

                    field("Beer Category Name [CC]"; "Beer Category Name [CC]")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    actions
    {
        addlast(Processing)
        {        
            group(BeerActions)
            {
                Action("Beer Category")
                {
                    ApplicationArea     = All;
                    PromotedIsBig       = true;
                    PromotedCategory    = Process;
                    Promoted            = true;         
                    Image               = Card;
                    Visible             = "Beer Item [CC]";                    
                    CaptionML           = ENU = 'Beer Category',
                                          DEU = 'Bier Kategorie';
                    
                    RunObject           = page "Beer Category Card [CC]";
                    RunPageView         = order(ascending) where("Code" = field("Beer Category Code [CC]"));
                }
            }
        }
    }

    // var mBeerVisible: Boolean; 

    // trigger OnOpenPage()
    // begin
    //     mBeerVisible := true;
    // end;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     mBeerVisible := Rec."Beer Item [CC]";        
    // end;
}