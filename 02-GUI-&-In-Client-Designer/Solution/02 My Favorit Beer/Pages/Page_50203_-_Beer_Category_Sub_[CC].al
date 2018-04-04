page 50203 "Beer Category Sub [CC]"
{
    PageType             = ListPart;
    SourceTable          = "Beer Category [CC]";    
    SourceTableView      = sorting(Code) order(ascending);
    SourceTableTemporary = true;
    InsertAllowed        = false;
    DeleteAllowed        = false;
    CaptionML            = ENU = 'Beer Category List', 
                           DEU = 'Bier Kategorie Liste';
    CardPageId           = "Beer Category Card [CC]";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Selected"; Selected)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Select',
                                DEU = 'Auswahl';

                    trigger OnValidate()
                    begin
                        // Change the selection
                        if Selected and (not SelectedRecords.Contains(Code)) then    
                            SelectedRecords.Add(Code)
                        else if (not Selected) and SelectedRecords.Contains(Code) then
                            SelectedRecords.Remove(Code);
                        CurrPage.Update(false);
                    end;
                }
                field("Code"; "Code")
                {
                    ApplicationArea = All;
                    Editable        = false;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    Editable        = false;
                }
                field("Description"; "Description")
                {
                    ApplicationArea = All;
                    Editable        = false;
                }
            }
        }
    }

    var Selected:           Boolean;
        SelectedRecords:    List of [Code[20]];     // contains the "Code" of each selected record


    trigger OnAfterGetCurrRecord()
    begin
        Selected := SelectedRecords.Contains(Code);    
    end;

    trigger OnAfterGetRecord()
    begin
        Selected := SelectedRecords.Contains(Code);    
    end;


    procedure AssignRecord(var beerCategories: Record "Beer Category [CC]")
    begin
        // Clear local information
        Rec.DeleteAll();
        Clear(SelectedRecords);
        
        // Copy the data into the local record and Select everything (add Code into the List "SelectedRecords")
        if beerCategories.FindSet() then
        repeat
            Rec.TransferFields(beerCategories);
            Rec.Insert();
            SelectedRecords.Add(beerCategories.Code);
        until beerCategories.Next() = 0;

        // Update the view
        CurrPage.Update(false);
    end;

    procedure GetSelectedRecords(var beerCategories: Record "Beer Category [CC]")
    var c: Code[20];
    begin
        // Copy all selected records (Code should be in the List "SelectedRecords")
        foreach c in SelectedRecords do
        begin
            Rec.SetRange(Code, c);
            if Rec.FindFirst() then
            begin
                beerCategories.TransferFields(Rec);
                if not beerCategories.Insert() then
                    beerCategories.Modify();
            end;
        end;
    end;
}
