codeunit 60302 "CCO C Item Jnl.-Post Line +"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        AssignItemHazardCategoryCode(ItemJournalLine, NewItemLedgEntry);
    end;

    local procedure AssignItemHazardCategoryCode(ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."CCO Hazard Category Code" := ItemJournalLine."CCO Hazard Category Code";
    end;
}