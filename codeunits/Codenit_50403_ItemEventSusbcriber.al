codeunit 50412 "Item Event Subscriber"
{
    [EventSubscriber(
        ObjectType::Table,
        Database::Item,
        'OnAfterInsertEvent',
        '',
        false,
        false)]
    local procedure OnAfterItemInsert(
        var Rec: Record Item;
        RunTrigger: Boolean)
    var
        ProductEvent: Record "Product Event";
    begin
        ProductEvent.Init();

        ProductEvent."Event Type" := "Event Type"::"Item Created";
        ProductEvent."Item No" := Rec."No.";
        ProductEvent."Event Date" := Today;
        ProductEvent."User Id" := CopyStr(UserId(), 1, MaxStrLen(ProductEvent."User Id"));
        ProductEvent.Description := CopyStr(
            'Item created: ' + Rec."No.",
            1,
            MaxStrLen(ProductEvent.Description));

        ProductEvent.Insert(true);
    end;

    local procedure CheckPurchasePosting()
    var
        PurchPost: Codeunit "Purch.-Post";
    begin
    end;




}







