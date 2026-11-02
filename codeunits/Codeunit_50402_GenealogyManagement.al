codeunit 50402 "Genealogy Management"
{

    procedure GetBackwardTrace(ItemNo: Code[20]; LotNo: Code[50])
    var
        TraceabilityEntry: Record "Tracibility Entry";
    begin
        TraceabilityEntry.Reset();

        TraceabilityEntry.SetRange("Destination Item No", ItemNo);
        TraceabilityEntry.SetRange("Destination Lot No.", LotNo);

        if TraceabilityEntry.FindSet() then begin
            repeat
            // Backward trace logic will be developed here.
            // Source = where the product came from.
            until TraceabilityEntry.Next() = 0;
        end;
    end;

    procedure GetForwardTrace(ItemNo: Code[20]; LotNo: Code[50])
    var
        TraceabilityEntry: Record "Tracibility Entry";
    begin
        TraceabilityEntry.Reset();

        TraceabilityEntry.SetRange("Source Item No.", ItemNo);
        TraceabilityEntry.SetRange("Source Item No.", LotNo);

        if TraceabilityEntry.FindSet() then begin
            repeat
            // Forward trace logic will be developed here.
            // Destination = where the product went.
            until TraceabilityEntry.Next() = 0;
        end;
    end;
}