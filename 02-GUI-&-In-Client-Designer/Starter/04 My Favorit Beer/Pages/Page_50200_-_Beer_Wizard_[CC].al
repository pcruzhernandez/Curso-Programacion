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

            }

            group(BeerListScreen)
            {
                CaptionML           = ENU = 'Beer Categories',
                                      DEU = 'Bier Kategorien';
                InstructionalTextML = ENU = 'Please add your Beer Categories to the list',
                                      DEU = 'Bitte fügen Sie Bier Kategorien der Liste hinzu';
                Visible             = BeerCategoriesVisible;
                
                
            }

            group(FinishScreen)
            {
                CaptionML           = ENU = 'Finish Setup',
                                      DEU = 'Einrichtung abschließen';
                InstructionalTextML = ENU = 'Import of selected Beer Categories',
                                      DEU = 'Import der ausgewählten Bier Kategorien';
                
                Visible             = FinishVisible;

                
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
    
    trigger OnInit()
    begin
        // Assign the Start Page
        UpdateView(0);

        // Initialize the default values
        
    end;


    local procedure UpdateView(newPage: Integer)
    begin                        
        if newPage > CurrentPage::Finish  then newPage := CurrentPage::Finish;
        if newPage < CurrentPage::Welcome then newPage := CurrentPage::Welcome;

        

        // Change the Page & Update the visibility
        CurrentPage             := newPage;
        WelcomeVisible          := (CurrentPage = CurrentPage::Welcome);
        BeerCategoriesVisible   := (CurrentPage = CurrentPage::"Beer Categories");
        FinishVisible           := (CurrentPage = CurrentPage::Finish);
    end;

    local procedure Finish()
    begin
        // Apply with import option (replace / merge)

        // Close the page
        CurrPage.Close();
    end;
}