// Transfers "Hazard Category" from "Purchase Line" to "Item Journal Line" during the course of Purch.-Posting (CU 90)
codeunit 60301 "CCO T Item Journal Line +"
{
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure HandleOnAfterCopyItemJnlLineFromPurchLine(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        AssignItemHazardCategoryCode(PurchLine, ItemJnlLine);
    end;

    local procedure AssignItemHazardCategoryCode(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."CCO Hazard Category Code" := PurchLine."CCO Hazard Category Code";
    end;
}