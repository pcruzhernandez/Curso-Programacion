pageextension 50201 "Customer Card [CC]" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group(Beer)
            {
                CaptionML = ENU = 'Favorite Beer',
                            DEU = 'Lieblingsbier';
                Visible   = mBeerSetup;
                field("Beer Category Code [CC]";"Beer Category Code [CC]")
                {
                    ApplicationArea = All;
                }

                field("Beer Category Name [CC]";"Beer Category Name [CC]")
                {
                    ApplicationArea = All;
                }

                field("Favorite Beer [CC]";"Favorite Beer [CC]")
                {
                    ApplicationArea = All;
                }

                field("Favorite Beer Name [CC]";"Favorite Beer Name [CC]")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        addlast(Navigation)
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
                    Visible             = mBeerSetup;
                    CaptionML           = ENU = 'Beer Category',
                                          DEU = 'Bier Kategorie';
                    
                    RunObject           = page "Beer Category Card [CC]";
                    RunPageView         = order(ascending) where("Code" = field("Beer Category Code [CC]"));
                }
            
                Action("Beer Items")
                {
                    ApplicationArea     = All;
                    PromotedIsBig       = true;
                    PromotedCategory    = Process;
                    Promoted            = true;         
                    Image               = List;
                    Visible             = mBeerSetup;
                    CaptionML           = ENU = 'Beers',
                                          DEU = 'Biere';
                    
                    RunObject           = page "Item List";
                    RunPageView         = order(ascending) where("Beer Item [CC]" = const(true));
                }
            }
        }
    }
    
    var mBeerSetup: Boolean;
        mBeerMgt:   Codeunit "Beer Mgt. [CC]";

    trigger OnOpenPage()
    begin
        mBeerSetup := mBeerMgt.CheckSetup();
    end;

    trigger OnAfterGetRecord()
    begin
        mBeerSetup := mBeerMgt.CheckSetup();    
    end;
}