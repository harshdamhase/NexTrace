
page 50404 "Product Event list"
{
    PageType = List;
    Caption = 'Product Event List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Product Event";

    // Product events act as a history log.
    // Users should not directly modify generated history.
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    Caption = 'Entry No.';
                }

                field("Event Date"; Rec."Event Date")
                {
                    ApplicationArea = All;
                    Caption = 'Event Date';
                }

                field("Event Type"; Rec."Event Type")
                {
                    ApplicationArea = All;
                    Caption = 'Event Type';
                }

                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                }

                field("Lot No"; Rec."Lot No")
                {
                    ApplicationArea = All;
                    Caption = 'Lot No.';
                }

                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                }

                field("Location code"; Rec."Location code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                }

                field("Passport Entry No"; Rec."Passport Entry No")
                {
                    ApplicationArea = All;
                    Caption = 'Passport Entry No.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    Caption = 'User ID';
                }
            }
        }
    }
}
