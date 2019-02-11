page 50105 "Beer API [CC]"
{
    PageType = API;
    Caption = 'apiPageName';
    APIPublisher = 'Workshop';
    APIGroup = 'FavoritBeer';
    APIVersion = 'v1.0';
    EntityName = 'beer';
    EntitySetName = 'beers';
    SourceTable = item;
    DelayedInsert = true;
    ODataKeyFields = Id;

    layout
    {
        area(Content)
        {
            repeater(Beers)
            {
                field(id; Id)
                {
                    Caption = 'id';
                }
                field(beerCategoryCode; "Beer Category Code [CC]")
                {
                    Caption = 'beerCategoryCode';
                }

                field(beerCategoryName; "Beer Category Name [CC]")
                {
                    Caption = 'beerCategoryName';
                }
                field(name; Description)
                {
                    Caption = 'name';
                }
            }
        }
    }
}