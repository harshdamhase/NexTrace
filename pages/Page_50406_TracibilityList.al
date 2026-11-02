page 50406 "Tracibility List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Tracibility Entry";
    Caption = 'Traceability Entries';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {

                }
                field("Trace Type"; Rec."Trace Type")
                {
                }
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

                field(Quantity; Rec.Quantity)
                {

                }
                field("Location Code"; Rec."Location Code")
                {

                }
                field("Posting Date"; Rec."Posting Date")
                {

                }
            }
        }


        area(Factboxes)
        {

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
}