codeunit 80101 "CCO P Customer Card +"
{
    procedure HandleOnActionSuggestSalutationTrigger(var Rec: record Customer)
    begin
        Rec.CCOSuggestSalutation(Rec);
    end;
}