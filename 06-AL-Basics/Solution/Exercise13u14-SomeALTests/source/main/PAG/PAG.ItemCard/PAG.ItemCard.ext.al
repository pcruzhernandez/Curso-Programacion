pageextension 70000 "CCO ItemCard +" extends "Item Card" //30
{
    layout
    {
        addbefore("No.")
        {
            label(ItemNoLabel)
            {
                CaptionML = ENU = 'Here comes the Item No.',
                            DEU = 'Hier kommt die Artikelnr.';
            }
        }
    
        // move "Replenishment System" from whereever 
        //    (actually: "Warehouse") at "head" of tab Item
        movelast(Item; "Replenishment System")
    
        addlast(Item)
        {
            group(DescriptionBlock)
            {
                CaptionML = DEU = 'Beschreibungen',
                            ENU = 'Descriptions';

                field(DescriptionAgain; Description)
                {
                    ApplicationArea = All;
                }
                field(Description2; "Description 2")
                {
                    ApplicationArea = All;
                }
                field("CCO My New Description"; "CCO My New Description")
                {
                    ApplicationArea = All;
                }
            }
        }

        modify(Item)
        {
            CaptionML = DEU = 'Artikelregister',
                        ENU = 'Item Fast Tab';
        }

        addbefore(Item)
        {
            // area(content)
            // {
            group(Descriptions)
            {
                CaptionML = DEU = 'Beschreibungen',
                                 ENU = 'Descriptions';

                field(DescriptionAgain2; Description)
                {
                    ApplicationArea = All;
                }
                field(Description2Again; "Description 2")
                {
                    ApplicationArea = All;
                }
                field(CCOMyNewDescriptionAgain; "CCO My New Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        addlast("S&ales")
        {
            action(CCOCurrencies)
            {
                CaptionML = ENU = 'Currencies',
                            DEU = 'Währungen';
                RunObject = page Currencies;
            }
        }
    }
}