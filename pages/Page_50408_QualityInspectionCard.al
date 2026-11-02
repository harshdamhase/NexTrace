
page 50408 "Quality Inspection Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Quality Inspection";
    Caption = 'Quality Inspection Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Product Passport Entry No."; Rec."Product Passport Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Lot No"; Rec."Lot No")
                {
                    ApplicationArea = All;
                }

                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = All;
                }

                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = All;
                }

                field(Inspector; Rec.Inspector)
                {
                    ApplicationArea = All;
                }

                field("Quality Result"; Rec."Quality Result")
                {
                    ApplicationArea = All;
                }

                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }

            group(Audit)
            {
                Caption = 'Audit Information';

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Created Date-Time"; Rec."Created Date-Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Completed By"; Rec."Completed By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Completed Date-Time"; Rec."Completed Date-Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
