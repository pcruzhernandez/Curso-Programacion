query 50105 "Beer Customer API [CC]"
{
    QueryType = API;
    APIPublisher = 'Workshop';
    APIGroup = 'FavoritBeer';
    APIVersion = 'v1.0';
    EntityName = 'beerCustomer';
    EntitySetName = 'beerCustomers';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(id; Id) { }
            column(no; "No.") { }
            column(name; Name) { }
            column(beerCategoryCode; "Beer Category Code [CC]") { }
            dataitem(item; "Item")
            {
                DataItemLink = "Beer Category Code [CC]" = Customer."Beer Category Code [CC]";

                SqlJoinType = InnerJoin;
                column(description; Description) { }
                dataitem(countryRegion; "Country/Region")
                {
                    DataItemLink = Code = Customer."Country/Region Code";
                    SqlJoinType = LeftOuterJoin;
                    column(countryRegionName; Name) { }
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
        //SetFilter(BeerCategoryCode, '<>''''');
    end;
}