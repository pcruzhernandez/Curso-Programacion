tableextension 50200 "Cutomer [CC]" extends Customer
{
    fields
    {
        field(50200; "Beer Category Code [CC]"; Code[20])
        {
            CaptionML     = ENU = 'Beer Category Code', DEU = 'Bier Kategorie Code';
            Description   = '[Dev] GUI & In-Client Designer';
            TableRelation = "Beer Category [CC]".Code;   

            trigger OnValidate();
            var BeerItems: Record Item;
            begin
                CalcFields("Beer Category Name [CC]");

                BeerItems.SetRange("Beer Item [CC]", true);
                BeerItems.SetRange("Beer Category Code [CC]", "Beer Category Code [CC]");
                // TODO: Send a notification about the missmatch
            end;         
        }

        field(50201; "Beer Category Name [CC]"; Code[20])
        {
            CaptionML     = ENU = 'Beer Category Name', DEU = 'Bier Kategorie Name';
            Description   = '[Dev] GUI & In-Client Designer';
            FieldClass    = FlowField;
            CalcFormula   = lookup ("Beer Category [CC]".Name where (Code = field ("Beer Category Code [CC]")));
            Editable      = false;
        }
        
        field(50202; "Favorite Beer [CC]"; Code[20])
        {
            CaptionML     = ENU = 'Favorite Beer Code', DEU = 'Lieblings-Bier Code';
            Description   = '[Dev] GUI & In-Client Designer';
            TableRelation = Item."No." where ("Beer Item [CC]" = const (true));
        }

        field(50203; "Favorite Beer Name [CC]"; Text[50])
        {
            CaptionML     = ENU = 'Favorite Beer Name', DEU = 'Lieblings-Bier Name';
            Description   = '[Dev] GUI & In-Client Designer';
            
        }
    }
    keys
    { }
}

