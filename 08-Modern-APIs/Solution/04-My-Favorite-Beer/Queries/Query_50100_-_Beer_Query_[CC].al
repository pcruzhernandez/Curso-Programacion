query 50100 "Beer Items [CC]"
{
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            column(id; Id) { }
            column(Name; Description) { }

            column(IsBeerItem; "Beer Item [CC]") { }
            column(BeerCategoryCode; "Beer Category Code [CC]") { }
            column(BeerCategoryName; "Beer Category Name [CC]") { }
            column(Description; Description) { }

            dataitem(Customer; "Customer")
            {
                DataItemLink = "Beer Category Code [CC]" = Item."Beer Category Code [CC]";
                SqlJoinType = LeftOuterJoin;

                column(CustomerName; Name) { }
                dataitem(CountryRegion; "Country/Region")
                {
                    DataItemLink = Code = Customer."Country/Region Code";
                    SqlJoinType = LeftOuterJoin;
                    column(CountryRegionName; Name) { }
                }
            }
        }

    }

    trigger OnBeforeOpen()
    begin
        SetRange(IsBeerItem, true);
        SetFilter(BeerCategoryCode, '<>''''');
    end;
}