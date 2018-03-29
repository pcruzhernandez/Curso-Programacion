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
            group(MyActionGroup)
            {
                Action(MyAction1)
                {
                    Image = History;
                    ApplicationArea = All;
                    PromotedIsBig = true;
                    PromotedCategory = New;
                    Promoted = true;         
                    CaptionML = ENU='Hello!';
                    
                    RunObject = page "Beer Category Card [CC]";
                    RunPageView = order(ascending) where("Code" = field("Beer Category Code [CC]"));

                    trigger OnAction();
                    var mB:Boolean;
                        mB2:Boolean;
                    begin
                        Message('My message');
                    end;                    
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
    //     //Message('OnAfterGetCurrRecord: %1', Rec."Beer Item [CC]");    
    //     mBeerVisible := Rec."Beer Item [CC]";        
    // end;
}