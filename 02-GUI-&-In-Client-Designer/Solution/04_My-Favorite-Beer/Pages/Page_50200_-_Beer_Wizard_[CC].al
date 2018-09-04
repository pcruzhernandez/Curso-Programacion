page 50200 "Beer Wizard [CC]"
{
    PageType             = NavigatePage;
    SourceTable          = "Beer Category [CC]";
    CaptionML            = ENU = 'Beer Categories Setup',
                           DEU = 'Bier Kategorien Einrichtung';
    
    layout
    {
        area(content)
        {
            group(WelcomeScreen)
            {
                CaptionML = ENU = 'Welcome',
                            DEU = 'Willkommen';
                InstructionalTextML = ENU = 'Setup of Beer Categories\(you may import the file "...\Assets\BeerCategories.json")',
                                      DEU = 'Einrichtung der Bier Kategorien\(Sie können die Datei "...\Assets\BeerCategories.json" importieren)';
                
                Visible = WelcomeVisible;

                group(Json)
                {
                    CaptionML = ENU = 'Beer Categories - Json',
                                DEU = 'Bier Kategorien - Json';
                    field(BeerJson; BeerJson)
                    {
                        ShowCaption = false;
                        MultiLine = true;
                        ApplicationArea = All;
                        AssistEdit = true;

                        trigger OnAssistEdit()
                        begin
                            ImportJsonFile();                        
                        end;
                    }                
                }
            }

            group(BeerListScreen)
            {
                CaptionML           = ENU = 'Beer Categories',
                                      DEU = 'Bier Kategorien';
                InstructionalTextML = ENU = 'Please add your Beer Categories to the list',
                                      DEU = 'Bitte fügen Sie Bier Kategorien der Liste hinzu';
                Visible             = BeerCategoriesVisible;
                
                part(BeerCategories; "Beer Category Sub [CC]")
                {
                    ApplicationArea = All;                
                }
            }

            group(FinishScreen)
            {
                CaptionML           = ENU = 'Finish Setup',
                                      DEU = 'Einrichtung abschließen';
                InstructionalTextML = ENU = 'Import of selected Beer Categories',
                                      DEU = 'Import der ausgewählten Bier Kategorien';
                
                Visible             = FinishVisible;

                field(ImportRecordCount;ImportRecordCount)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Selected Beer Categories',
                                DEU = 'Ausgewählte Bier Kategorien';
                    Editable  = false;
                    Enabled   = false;                    
                }

                field(KindOfImport;KindOfImport)
                {
                    ApplicationArea = All;
                    CaptionML       = ENU = 'Kind of Import',
                                      DEU = 'Art des Imports';
                    OptionCaptionML = ENU = 'Replace All,Merge',
                                      DEU = 'Alle ersetzen,Zusammenführen';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Back)
            {
                ApplicationArea = All;
                InFooterBar     = true;
                Visible         = (not WelcomeVisible);
                CaptionML       = ENU = 'Back', DEU = 'Zurück';
                Image           = PreviousRecord;

                trigger OnAction()
                begin
                     UpdateView(CurrentPage - 1);  
                end;
            }

            action(Next)
            {
                ApplicationArea = All;
                InFooterBar     = true;
                Visible         = (not FinishVisible);
                CaptionML       = ENU = 'Next', DEU = 'Weiter';
                Image           = NextRecord;

                trigger OnAction()
                begin
                     UpdateView(CurrentPage + 1);  
                end;
            }

            action(FinishSetup)
            {
                ApplicationArea = All;
                InFooterBar     = true;
                Visible         = FinishVisible;
                CaptionML       = ENU = 'Assign', DEU = 'Übernehmen';
                Image           = NextRecord;

                trigger OnAction()
                begin
                    Finish();                    
                end;
            }
        }
    }
    
    var CurrentPage:            Option "Welcome","Beer Categories","Finish";
        WelcomeVisible:         Boolean;
        BeerCategoriesVisible:  Boolean;
        FinishVisible:          Boolean;
        BeerJson:               Text;
        ImportRecordCount:      Integer;
        KindOfImport:           Option "Replace All","Merge";        
        cBeerJson:              TextConst ENU = '{"Beer Categories":[{"Name":"Altbier","Description": "German-Style Altbier"},{"Name":"Amber ale","Description": "American-Style Amber/Red Ale"}]}';
        tmpBeerCategories:      Record "Beer Category [CC]" temporary;
    
    trigger OnInit()
    begin
        // Assign the Start Page
        UpdateView(0);

        // Initialize the default values
        BeerJson := Format(cBeerJson);
    end;


    local procedure UpdateView(newPage: Integer)
    begin                        
        if newPage > CurrentPage::Finish  then newPage := CurrentPage::Finish;
        if newPage < CurrentPage::Welcome then newPage := CurrentPage::Welcome;

        // Prepare New Page: Welcome --> Beer Category List
        if (CurrentPage = CurrentPage::Welcome) and (newPage = CurrentPage::"Beer Categories") then
            if not ImportBeerCategoriesFromJson() then exit;
        // Prepare New Page: Beer Category List --> Finish
        if (CurrentPage = CurrentPage::"Beer Categories") and (newPage = CurrentPage::Finish) then
        begin
            tmpBeerCategories.DeleteAll();
            CurrPage.BeerCategories.Page.GetSelectedRecords(tmpBeerCategories);
            ImportRecordCount   := tmpBeerCategories.Count();
        end;

        // Change the Page & Update the visibility
        CurrentPage             := newPage;
        WelcomeVisible          := (CurrentPage = CurrentPage::Welcome);
        BeerCategoriesVisible   := (CurrentPage = CurrentPage::"Beer Categories");
        FinishVisible           := (CurrentPage = CurrentPage::Finish) and (ImportRecordCount > 0);
    end;

    local procedure Finish()
    begin
        // Apply with import option (replace / merge)
        case KindOfImport of
            KindOfImport::"Replace All": DeleteAll();
            KindOfImport::Merge:         ;
        end;

        // Import the new values
        if tmpBeerCategories.FindSet() then
        repeat
            TransferFields(tmpBeerCategories);
            if not Insert() then 
                Modify();
        until tmpBeerCategories.Next() = 0;

        // Close the page
        CurrPage.Close();
    end;


    local procedure ImportJsonFile()
    var windowTitle: TextConst ENU = 'Import Beer Categories', 
                               DEU = 'Import Bier Kategorien';
        fileFilter:  TextConst ENU = 'All Files (*.*)|*.*|Json Files (*.json)|*.json', 
                               DEU = 'Alle Dateien (*.*)|*.*|Json Dateien (*.json)|*.json';
        
        name:        Text;
        data:        TextBuilder;
        line:        Text;
        stm:         InStream;        
    begin
        // Import the local file content
        if not UploadIntoStream(windowTitle, '', fileFilter, name, stm) then exit;
        
        // Read all data from file
        while stm.ReadText(line) > 0 do
        begin
            data.AppendLine(line);
        end;

        // Assign the imported text to the Field
        BeerJson := data.ToText();
        CurrPage.Update();
    end;

    local procedure ImportBeerCategoriesFromJson(): Boolean
    var jObject:     JsonObject;
        jToken:      JsonToken;
        jItem:       JsonToken;        
    begin
        if not jObject.ReadFrom(BeerJson)             then exit(false);
        if not jObject.Get('Beer Categories', jToken) then exit(false);
        if not jToken.IsArray()                       then exit(false);

        // Clear the temp-record
        tmpBeerCategories.DeleteAll();

        // Import all items in the array 'Beer Categories' into the tmp.-record
        foreach jItem in jToken.AsArray() do
            if jItem.IsObject() then
        begin
            ImportBeerCategoryFromJson(tmpBeerCategories, jItem.AsObject());
        end;
        
        // assign the temp-record to the list part
        CurrPage.BeerCategories.Page.AssignRecord(tmpBeerCategories);
        exit(true);
    end;

    local procedure ImportBeerCategoryFromJson(var beerCategory: Record "Beer Category [CC]"; jData: JsonObject)
    var jToken: JsonToken;
    begin
        beerCategory.Init();
        
        // read the Json information {"Name": "...", "Description": "..."} from jData
        if jData.Get('Name', jToken) then
            if jToken.IsValue() then
                beerCategory.Name := jToken.AsValue().AsText();
        if jData.Get('Description', jToken) then
            if jToken.IsValue() then
                beerCategory.Description := jToken.AsValue().AsText();
        
        // Avoid an overflow of the Code-Field
        beerCategory.Code := DelStr(beerCategory.Name, MaxStrLen(beerCategory.Code) + 1);
        beerCategory.Insert();
    end;
}