
page 50407 "Quality Inspection List page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Quality Inspection";
    Caption = 'Quality Inspection List';
    CardPageId = "Quality Inspection Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = All;
                }

                field("Product Passport Entry No."; Rec."Product Passport Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
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
                }
            }
        }
    }
}
