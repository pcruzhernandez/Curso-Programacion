codeunit 50100 "Install Codeunit [CC]"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        Customer: Record Customer;
    begin
        AddBeerCategory('PILS', 'Pilsner', '');
        AddBeerCategory('LAGER', 'Lager Beer', '');
        AddBeerCategory('ALE', 'Ale', '');

        AddBeerItem('ALE', 'Atlantic Ale');
        AddBeerItem('PILS', 'Radeberger Pilsner');
        AddBeerItem('PILS', 'Freiberger Pilsner');

        Customer.ModifyAll("Beer Category Code [CC]", 'PILS');
        AddBeerCustomer('10000', 'ALE', 'Atlantic Ale');
    end;

    local procedure AddBeerCategory(code: code[20]; name: Text; description: Text): Boolean;
    var
        BeerCategory: Record "Beer Category [CC]";
    begin
        BeerCategory.Init;
        BeerCategory.Code := code;
        BeerCategory.Name := name;
        BeerCategory.Description := description;
        exit(BeerCategory.Insert);
    end;

    local procedure AddBeerItem(code: code[20]; name: Text): Boolean;
    var
        Item: Record Item;
    begin
        Item.Init;
        Item."No." := name;
        Item.Description := name;
        if not Item.Insert(true) then;
        Item."Beer Item [CC]" := true;
        Item."Beer Category Code [CC]" := code;
        exit(Item.Modify(true));
    end;

    local procedure AddBeerCustomer(customerNo: code[20]; code: code[20]; beerCode: code[20]): Boolean;
    var
        Customer: Record Customer;
    begin
        if not Customer.Get(customerNo) then exit(false);
        Customer."Beer Category Code [CC]" := code;
        Customer."Favorite Beer [CC]" := beerCode;
        exit(Customer.Modify());
    end;
}