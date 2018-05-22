pageextension 50102 PageExtension50102 extends "Item Card"
{
    layout
    {
        modify(Item)
        {
            Caption = 'My unlimited Item Information';
        }
        moveafter("Item Category Code"; Blocked)
    moveafter(Blocked; "Last Date Modified")
    modify(InventoryGrp)
        {
            Caption = 'My Inventory';
        }
        movefirst(FactBoxes; ItemAttributesFactbox)
        modify(Control1900383207)
        {
            Visible = false;
        }
        moveafter("Attached Documents"; ItemPicture)
    }
}
