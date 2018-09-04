codeunit 50200 "Install Codeunit [CC]"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase();
    var beerMgt: Codeunit "Beer Mgt. [CC]";
    begin
        //beerMgt.InitBeerSetupNotification();
        //beerMgt.InitCustomerBeerNotification();

        AddBeerCategory('PILS',  'Pilsner',    '');
        AddBeerCategory('LAGER', 'Lager Beer', '');
        AddBeerCategory('ALE',   'Ale',        '');
    end;
    
    local procedure AddBeerCategory(code: code[20]; name: Text; description: Text) : Boolean;
    var BeerCategory : Record "Beer Category [CC]";
    begin
        BeerCategory.Init;
        BeerCategory.Code        := code;
        BeerCategory.Name        := name;
        BeerCategory.Description := description;
        exit(BeerCategory.Insert);
    end;
}