codeunit 60300 "CCO T Purchase Line +"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterAssignItemValues', '', true, true)]
    local procedure HandleOnAfterAssignItemValues(Item: Record Item; var PurchLine: Record "Purchase Line")
    begin
        AssignItemHazardCategoryCode(Item, PurchLine);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateEvent', 'Type', true, true)]
    local procedure HandleOnBeforeValidateEventType(CurrFieldNo: Integer; var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        RemoveHazardcategoryCode(Rec);
    end;

    procedure HandleOnValidateHazardcategoryCodeTrigger(CurrentFieldNumber: Integer; var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        IfHazardcategoryThenCheckIsItemLine(Rec, false);
        Rec.CheckIsItemLine(Rec, false);
    end;

    local procedure RemoveHazardcategoryCode(PurchaseLine: Record "Purchase Line")
    begin
        PurchaseLine."CCO Hazard Category Code" := '';
    end;

    local procedure AssignItemHazardCategoryCode(Item: Record Item; var PurchLine: Record "Purchase Line")
    begin
        PurchLine."CCO Hazard Category Code" := Item."CCO Hazard Category Code";
    end;

    local procedure IfHazardcategoryThenCheckIsItemLine(PurchLine: Record "Purchase Line"; HideError: Boolean): Boolean
    begin
        if not (PurchLine.Type = PurchLine.Type::Item) then
            exit(false);
        PurchLine.CheckIsItemLine(PurchLine, HideError);
    end;

    procedure CheckIsItemLine(PurchLine: Record "Purchase Line"; HideError: Boolean): Boolean
    begin
        IF HideError then
            exit(TryCheckIsItemLine(PurchLine));
        TryCheckIsItemLine(PurchLine);
    end;

    [TryFunction]
    local procedure TryCheckIsItemLine(PurchLine: Record "Purchase Line")
    begin
        PurchLine.TestField(Type, PurchLine.Type::Item);
    end;
}