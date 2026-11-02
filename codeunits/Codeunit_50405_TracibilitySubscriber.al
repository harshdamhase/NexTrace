
codeunit 50405 "Traceability Subscriber"
{
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
        TransferShipmentEntry: Record "Item Ledger Entry";
    begin
        if Rec."Entry Type" <> Rec."Entry Type"::Transfer then
            exit;

        // Create a trace row when the transfer receipt establishes its destination.
        if not Rec.Positive or
           (Rec."Order Type" <> Rec."Order Type"::Transfer) or
           (Rec."Order No." = '')
        then
            exit;

        TransferShipmentEntry.SetRange(
            "Order Type",
            TransferShipmentEntry."Order Type"::Transfer);
        TransferShipmentEntry.SetRange("Order No.", Rec."Order No.");
        TransferShipmentEntry.SetRange("Order Line No.", Rec."Order Line No.");
        TransferShipmentEntry.SetRange("Item No.", Rec."Item No.");
        TransferShipmentEntry.SetRange("Lot No.", Rec."Lot No.");
        TransferShipmentEntry.SetRange("Serial No.", Rec."Serial No.");
        TransferShipmentEntry.SetRange(Positive, false);

        if not TransferShipmentEntry.FindFirst() then
            Error(
                'The shipment entry for transfer order %1, line %2, item %3 was not found.',
                Rec."Order No.",
                Rec."Order Line No.",
                Rec."Item No.");

        TraceEntry.Init();
        TraceEntry."Trace Type" := 'Transfer';
        TraceEntry."Source Type" := 'Transfer Shipment';
        TraceEntry."Source Document No" := TransferShipmentEntry."Document No.";
        TraceEntry."Source Item No." := TransferShipmentEntry."Item No.";
        TraceEntry."Source Lot No." := TransferShipmentEntry."Lot No.";
        TraceEntry."Source Serial No" := TransferShipmentEntry."Serial No.";
        TraceEntry."Destination Type" := 'Transfer Receipt';
        TraceEntry."Destination Document No" := Rec."Document No.";
        TraceEntry."Destination Item No" := Rec."Item No.";
        TraceEntry."Destination Lot No." := Rec."Lot No.";
        TraceEntry."Destination Serial No." := Rec."Serial No.";
        TraceEntry.Quantity := Abs(Rec.Quantity);
        TraceEntry."Location Code" := Rec."Location Code";
        TraceEntry."Posting Date" := Rec."Posting Date";
        TraceEntry."Unit of Measure Code" := Rec."Unit of Measure Code";
        TraceEntry."Created Date-Time" := CurrentDateTime();
        TraceEntry."Created By" :=
            CopyStr(UserId(), 1, MaxStrLen(TraceEntry."Created By"));

        TraceEntry.Insert(true);
    end;
}
