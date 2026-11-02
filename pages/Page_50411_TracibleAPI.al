
page 50411 "Traceability Entries API"
{
    PageType = API;
    APIPublisher = 'nextrace';
    APIGroup = 'traceability';
    APIVersion = 'v1.0';

    EntityName = 'traceabilityEntry';
    EntitySetName = 'traceabilityEntries';

    SourceTable = "Tracibility Entry";
    //   ODataKeyFields = SystemId;
    DelayedInsert = true;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No")
                {
                }
                field(traceType; Rec."Trace Type")
                {
                }
                field(sourceType; Rec."Source Type")
                {
                }
                field(sourceDocumentNo; Rec."Source Document No")
                {
                }
                field(sourceItemNo; Rec."Source Item No.")
                {
                }
                field(sourceLotNo; Rec."Source Lot No.")
                {
                }
                field(sourceSerialNo; Rec."Source Serial No")
                {
                }
                field(destinationType; Rec."Destination Type")
                {
                }
                field(destinationDocumentNo; Rec."Destination Document No")
                {
                }
                field(destinationItemNo; Rec."Destination Item No")
                {
                }
                field(destinationLotNo; Rec."Destination Lot No.")
                {
                }
                field(destinationSerialNo; Rec."Destination Serial No.")
                {
                }
                field(quantity; Rec.Quantity)
                {
                }
                field(locationCode; Rec."Location Code")
                {
                }
                field(postingDate; Rec."Posting Date")
                {
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                }
                field(createdDateTime; Rec."Created Date-Time")
                {
                }
                field(createdBy; Rec."Created By")
                {
                }
            }
        }
    }
}
