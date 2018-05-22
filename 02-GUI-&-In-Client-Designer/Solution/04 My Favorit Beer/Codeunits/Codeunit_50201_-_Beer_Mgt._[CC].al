codeunit 50201 "Beer Mgt. [CC]"
{
    // Create a GUID with PowerShell > [System.Guid]::NewGuid()        
    var cBeerSetupID : TextConst ENU = '40bf625e-3fd4-4a21-83d8-2f26909a1914';        
        cBeerMatchID : TextConst ENU = '30546dde-20ae-458e-9c12-c25e4491c3dd';

    // #### BEER MATCH NOTIFICATION ####

    procedure CheckBeer(customer: Record Customer): Boolean;
    var notification: Notification;   
        beerMatch: Boolean;
        id:  GUID;
        msg: TextConst ENU = 'The selected beer does not belong to the preferred category',
                       DEU = 'Das Bier gehört nicht zur bevorzugten Kategorie';
        myNotifications: Record "My Notifications";
    begin
        id        := FORMAT(cBeerMatchID);
        beerMatch := IsBeerMatch(customer);
                        
        if not myNotifications.IsEnabledForRecord(id, customer) then exit(beerMatch);
        
        notification.Scope   := Notification.Scope::LocalScope;
        notification.Id      := id;
        
        if beerMatch then
        begin
            notification.Recall();            
        end else begin
            notification.Message := msg;
            notification.Send();            
        end;

        exit(beerMatch);
    end;

    procedure IsBeerMatch(customer: Record Customer) : Boolean;
    var beerItems: Record Item;
    begin
        beerItems.SetRange("Beer Item [CC]",          true);
        beerItems.SetRange("Beer Category Code [CC]", customer."Beer Category Code [CC]");
        
        exit(not beerItems.IsEmpty());
    end;

    // #### SETUP NOTIFICATION ####

    procedure CheckBeerSetup() : Boolean;
    var notification: Notification;   
        id:  GUID;
        msg: TextConst ENU = 'Beer Categories are not configured', DEU = 'Bier-Kategorien sind nicht initialisiert';
        btn: TextConst ENU = 'Setup', DEU = 'Einrichten';
        myNotifications: Record "My Notifications";
    begin
        id := FORMAT(cBeerSetupID);
        if IsBeerSetupComplete() then exit(true);
        if not myNotifications.IsEnabled(id) then exit;

        notification.Scope   := Notification.Scope::LocalScope;
        notification.Id      := id;
        notification.Message := msg;
        notification.AddAction(btn, Codeunit::"Beer Mgt. [CC]", 'StartBeerSetup');
        notification.Send();
    end;

    procedure IsBeerSetupComplete() : Boolean;
    var beer: Record "Beer Category [CC]";
    begin
        if beer.IsEmpty() then exit(false);
        
        exit(true);
    end;

    procedure StartBeerSetup() : Boolean;
    var notification: Notification;        
        id:           Guid;
        isComplete:   Boolean;
        Wizard:       Page "Beer Wizard [CC]";
    begin
        if Wizard.RunModal() <> Action::OK then exit(false);

        isComplete := IsBeerSetupComplete();
        if isComplete then
        begin
            id := FORMAT(cBeerSetupID);
            notification.Scope   := Notification.Scope::LocalScope;
            notification.Id      := id;
            notification.Recall();
        end;

        exit(true);
    end;

    procedure StartBeerSetup(var notification: Notification)
    var isComplete:   Boolean;
        Wizard:       Page "Beer Wizard [CC]";
    begin
        if Wizard.RunModal() <> Action::OK then exit;

        isComplete := IsBeerSetupComplete();
        if isComplete then
            notification.Recall();
    end;


    // #### SETUP NOTIFICATION ####
    
    [EventSubscriber(ObjectType::Table, Database::"Aggregated Assisted Setup", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure OnRegisterAssistedSetup(var TempAggregatedAssistedSetup: Record "Aggregated Assisted Setup")
    var cName: TextConst ENU = 'Beer Category Setup', DEU = 'Bier Kategorie Setup';
        bc:    Record "Beer Category [CC]";
    begin
        TempAggregatedAssistedSetup.Init();
        TempAggregatedAssistedSetup."Assisted Setup Page ID" := Page::"Beer Wizard [CC]";
        TempAggregatedAssistedSetup.Name                     := cName;
        TempAggregatedAssistedSetup."Item Type"              := TempAggregatedAssistedSetup."Item Type"::"Setup and Help";
        if bc.IsEmpty() then
            TempAggregatedAssistedSetup.Status               := TempAggregatedAssistedSetup.Status::"Not Completed"
        else
            TempAggregatedAssistedSetup.Status               := TempAggregatedAssistedSetup.Status::Completed;

        TempAggregatedAssistedSetup.Insert();
    end;
}