page 50405 "Tracibility Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Tracibility Entry";

    layout
    {
        area(Content)
        {
            group(Identity)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Trace Type"; Rec."Trace Type")
                {
                    ApplicationArea = All;
                }

            }
            group(Source)
            {
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                }
                field("Source Document No"; Rec."Source Document No")
                {

                }
                field("Source Item No."; Rec."Source Item No.")
                {

                }
                field("Source Lot No."; Rec."Source Lot No.")
                {

                }
                field("Source Serial No"; Rec."Source Serial No")
                {

                }
            }
            group(Destination)
            {
                field("Destination Type"; Rec."Destination Type")
                {

                }
                field("Destination Item No"; Rec."Destination Item No")
                {

                }
                field("Destination Lot No."; Rec."Destination Lot No.")
                {

                }
                field("Destination Serial No."; Rec."Destination Serial No.")
                {

                }
                field("Destination Document No"; Rec."Destination Document No")
                {

                }

            }

            group(Transaction)
            {
                field(Quantity; Rec.Quantity)
                {

                }
                field("Location Code"; Rec."Location Code")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {

                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {

                }
                field("Created Date-Time"; Rec."Created Date-Time")
                {

                }
                field("Created By"; Rec."Created By")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}