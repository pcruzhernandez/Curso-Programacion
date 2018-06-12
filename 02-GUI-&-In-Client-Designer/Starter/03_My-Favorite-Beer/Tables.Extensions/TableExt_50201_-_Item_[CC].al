tableextension 50201 "Item [CC]" extends Item
{

    fields
    {
        field(50200; "Beer Item [CC]"; Boolean)
        {
            CaptionML     = ENU = 'Beer Item';
            Description   = '[Dev] GUI & In-Client Designer';
        }

        field(50201; "Beer Category Code [CC]"; Code[20])
        {
            CaptionML     = ENU = 'Beer Category Code', DEU = 'Bier Kategorie Code';
            Description   = '[Dev] GUI & In-Client Designer';
            TableRelation = "Beer Category [CC]".Code;
            
            trigger OnValidate();
            begin
                CalcFields("Beer Category Name [CC]");                
            end;
        }
        
        field(50202; "Beer Category Name [CC]"; Text[50])
        {
            CaptionML     = ENU = 'Beer Category Name', DEU = 'Bier Kategorie Name';
            Description   = '[Dev] GUI & In-Client Designer';
            FieldClass    = FlowField;
            CalcFormula   = lookup ("Beer Category [CC]".Name where (Code = field ("Beer Category Code [CC]")));
            Editable      = false;
        }        
    }
    keys
    {
    }
}