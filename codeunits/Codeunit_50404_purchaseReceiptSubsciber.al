
codeunit 50404 "Purchase Receipt Subscriber"
{
    // 1. Create Product Event when a posted receipt line is inserted
    [EventSubscriber(
        ObjectType::Table,
        Database::"Purch. Rcpt. Line",
        'OnAfterInsertEvent',
        '',
        false,
        false)]
    local procedure OnAfterInsertPurchaseReceiptLine(
        var Rec: Record "Purch. Rcpt. Line";
        RunTrigger: Boolean)
    var
        ProductEvent: Record "Product Event";
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        ProductEvent.Init();
        ProductEvent."Event Type" := "Event Type"::"Purchase Recipt";
        ProductEvent."Document No" := Rec."Document No.";
        ProductEvent."Item No" := Rec."No.";
        ProductEvent."Event Date" := Rec."Posting Date";
        ProductEvent."Location code" := Rec."Location Code";

        ProductEvent.Description := CopyStr(
            'Purchase receipt posted for item ' + Rec."No.",
            1,
            MaxStrLen(ProductEvent.Description));

        ProductEvent."User Id" :=
            CopyStr(
                UserId(),
                1,
                MaxStrLen(ProductEvent."User Id"));

        ProductEvent.Insert(true);
    end;


    // 2. Create Traceability Entry with actual tracking information
    [EventSubscriber(
        ObjectType::Table,
        Database::"Item Ledger Entry",
        'OnAfterInsertEvent',
        '',
        false,
        false)]
    local procedure OnAfterInsertItemLedgerEntry(
        var Rec: Record "Item Ledger Entry";
        RunTrigger: Boolean)
    var
        TraceEntry: Record "Tracibility Entry";
    begin
        // Process purchase entries only
        if Rec."Entry Type" <> Rec."Entry Type"::Purchase then
            exit;

        TraceEntry.Init();

        TraceEntry."Trace Type" := 'Purchase Receipt';
        TraceEntry."Source Type" := 'Purchase Receipt';
        TraceEntry."Source Document No" := Rec."Document No.";
        TraceEntry."Source Item No." := Rec."Item No.";

        // Read tracking values from Item Ledger Entry
        TraceEntry."Source Lot No." := Rec."Lot No.";
        TraceEntry."Source Serial No" := Rec."Serial No.";

        TraceEntry.Quantity := Abs(Rec.Quantity);
        TraceEntry."Location Code" := Rec."Location Code";
        TraceEntry."Posting Date" := Rec."Posting Date";
        TraceEntry."Unit of Measure Code" :=
            Rec."Unit of Measure Code";

        TraceEntry."Created Date-Time" := CurrentDateTime();
        TraceEntry."Created By" :=
            CopyStr(
                UserId(),
                1,
                MaxStrLen(TraceEntry."Created By"));

        TraceEntry.Insert(true);
    end;
}
