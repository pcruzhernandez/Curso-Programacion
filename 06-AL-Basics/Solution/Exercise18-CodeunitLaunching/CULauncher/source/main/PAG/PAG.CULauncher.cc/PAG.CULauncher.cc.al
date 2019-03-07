page 90000 "CCO CU Launcher"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    CaptionML = ENU = 'CU Launcher',
                DEU = 'CU Launcher';
    SaveValues = true;

    layout
    {
        area(Content)
        {
            group("CU 2 Launch")
            {
                field("Codeunit ID"; Codeunit2Launch)
                {
                    ApplicationArea = All;
                    BlankZero = true;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CULauncher)
            {
                ApplicationArea = All;
                   Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ObjectCU.HandleOnActionLaunchCUTrigger(Codeunit2Launch, false);
                end;
            }
        }
    }

    var
        ObjectCU: Codeunit "CCO CU Launcher";
        Codeunit2Launch: Integer;
}