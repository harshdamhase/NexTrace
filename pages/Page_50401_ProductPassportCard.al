page 50401 "Product Passport Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Product Passport";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                }

                field(ItemNo; Rec."Item No")
                {
                }

                field(Description; Rec.Description)
                {
                }

                field("Lot No"; Rec."Lot No")
                {
                }

                field("Serial No"; Rec."Serial No")
                {
                }
            }

            group(Manufacturing)
            {
                field("Manufacturing Date"; Rec."Manufacturing Date")
                {
                }

                field("Manufacturing location"; Rec."Manufacturing location")
                {
                }
            }

            group(Origin)
            {


                field("Supplier No"; Rec."Supplier No")
                {
                }
            }

            group(Status1)
            {
                field("Purchase Order No"; Rec."Purchase Order No")
                {
                }

                field("Quality Status"; Rec."Quality Status")
                {
                }

                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {


            action("Get Purchase Receipt")
            {
                ApplicationArea = All;
                Caption = 'Get Purchase Receipt Data';
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ReceiptLine: Record "Purch. Rcpt. Line";
                    ReceiptHeader: Record "Purch. Rcpt. Header";
                    ItemLedgerEntry: Record "Item Ledger Entry";
                    MatchingEntries: Integer;
                    FoundLotNo: Code[50];
                    FoundSerialNo: Code[50];
                    FoundSupplierNo: Code[20];
                    FoundOrderNo: Code[20];
                begin
                    Rec.TestField("Item No");

                    ReceiptLine.SetRange(Type, ReceiptLine.Type::Item);
                    ReceiptLine.SetRange("No.", Rec."Item No");

                    if Rec."Purchase Order No" <> '' then
                        ReceiptLine.SetRange(
                            "Order No.", Rec."Purchase Order No");

                    MatchingEntries := 0;

                    if ReceiptLine.FindSet() then
                        repeat
                            ItemLedgerEntry.Reset();
                            ItemLedgerEntry.SetRange(
                                "Item No.", Rec."Item No");
                            ItemLedgerEntry.SetRange(
                                "Document No.", ReceiptLine."Document No.");
                            ItemLedgerEntry.SetRange(
                                "Entry Type",
                                ItemLedgerEntry."Entry Type"::Purchase);

                            // Apply existing tracking values if provided.
                            if Rec."Lot No" <> '' then
                                ItemLedgerEntry.SetRange(
                                    "Lot No.", Rec."Lot No");

                            if Rec."Serial No" <> '' then
                                ItemLedgerEntry.SetRange(
                                    "Serial No.", Rec."Serial No");

                            if ItemLedgerEntry.FindSet() then
                                repeat
                                    MatchingEntries += 1;

                                    if MatchingEntries = 1 then begin
                                        FoundLotNo := ItemLedgerEntry."Lot No.";
                                        FoundSerialNo := ItemLedgerEntry."Serial No.";

                                        if ReceiptHeader.Get(
                                            ReceiptLine."Document No.")
                                        then begin
                                            FoundSupplierNo :=
                                                ReceiptHeader."Buy-from Vendor No.";
                                            FoundOrderNo :=
                                                ReceiptHeader."Order No.";
                                        end;
                                    end;
                                until ItemLedgerEntry.Next() = 0;
                        until ReceiptLine.Next() = 0;

                    if MatchingEntries = 0 then
                        Error(
                            'No matching tracking entry found for Item %1. Check the Purchase Order, Lot No. and Serial No.',
                            Rec."Item No");

                    if MatchingEntries > 1 then
                        Error(
                            'Multiple tracking entries match Item %1. Enter the correct Purchase Order, Lot No. or Serial No. and try again.',
                            Rec."Item No");

                    // Update only after a unique match has been found.
                    Rec."Lot No" := FoundLotNo;
                    Rec."Serial No" := FoundSerialNo;
                    Rec."Supplier No" := FoundSupplierNo;
                    Rec."Purchase Order No" := FoundOrderNo;

                    Rec.Modify(true);
                    CurrPage.Update(false);

                    Message(
                        'Product Passport updated successfully. Lot No.: %1, Serial No.: %2',
                        Rec."Lot No", Rec."Serial No");
                end;
            }

            action("Open Item")
            {
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ItemRec: Record Item;

                begin
                    Rec.TestField("Item No");

                    ItemRec.SetRange("No.", Rec."Item No");

                    if not ItemRec.FindFirst() then
                        Error(
                            'Item %1 was not found in the Item table.',
                            Rec."Item No");

                    Page.Run(Page::"Item Card", ItemRec);
                end;

            }
            action("ViewItemLedger")
            {
                Caption = 'View Item Ledger Entry';
                ToolTip = 'Open Item Ledger Entry & see the Inventory transaction';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = View;

                trigger OnAction()
                var
                    RecItemLedEntry: Record "Item Ledger Entry";
                begin
                    Rec.TestField("Item No");
                    RecItemLedEntry.SetRange("Item No.", Rec."Item No");

                    if Rec."Lot No" <> '' then
                        RecItemLedEntry.SetRange("Lot No.", Rec."Lot No");

                    if Rec."Serial No" <> '' then
                        RecItemLedEntry.SetRange("Serial No.", Rec."Serial No");

                    page.Run(Page::"Item Ledger Entries", RecItemLedEntry);
                end;
            }

            action("ViewTracibility")
            {
                ApplicationArea = All;
                Caption = 'View Traceability';
                Image = ViewPage;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    TraceEntry: Record "Tracibility Entry";
                begin
                    Rec.TestField("Item No");

                    TraceEntry.SetRange(
                        "Source Item No.",
                        Rec."Item No");

                    Page.Run(50406, TraceEntry);
                end;
            }

            action("ViewProductEvents")
            {
                ApplicationArea = All;
                Caption = 'View Product Events';
                Image = History;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ProductEvent: Record "Product Event";
                begin
                    Rec.TestField("Item No");

                    ProductEvent.SetRange("Item No", Rec."Item No");

                    Page.Run(50404, ProductEvent);
                end;
            }


            action("CreateQualityInspection")
            {
                ApplicationArea = All;
                Caption = 'Create Quality Inspection';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    QualityInspection: Record "Quality Inspection";
                    ProductPassport: Record "Product Passport";
                begin
                    Rec.TestField("Item No");

                    if (Rec."Lot No" = '') then
                        Error('Lot No.  must be available.');

                    if not ProductPassport.Get(Rec."Entry No", Rec."Item No") then
                        Error(
                            'Product Passport Entry No. %1 was not found.',
                            Rec."Entry No");

                    QualityInspection.Init();
                    QualityInspection."Product Passport Entry No." :=
                        ProductPassport."Entry No";

                    QualityInspection.Validate("Item No", ProductPassport."Item No");
                    QualityInspection.Description := ProductPassport.Description;
                    QualityInspection."Lot No" := ProductPassport."Lot No";
                    //    QualityInspection."Serial No" := ProductPassport."Serial No";
                    QualityInspection."Inspection Date" := Today;
                    QualityInspection."Quality Result" := "Quality Result"::Passed;

                    QualityInspection.Insert(true);

                    Message(
                        'Quality Inspection %1 created successfully.',
                        QualityInspection."Inspection No");
                end;
            }
            action("ViewQualityInspection")
            {
                ApplicationArea = All;
                Caption = 'View Quality Inspection';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    QualityInspection: Record "Quality Inspection";
                begin
                    Rec.TestField("Entry No");

                    QualityInspection.SetRange(
                        "Product Passport Entry No.", Rec."Entry No");

                    Page.Run(
                        Page::"Quality Inspection List page",
                        QualityInspection);
                end;
            }



            action(ValidatePassport)
            {
                ApplicationArea = All;
                Caption = 'Validate Passport';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    QualityInspection: Record "Quality Inspection";
                begin
                    Rec.TestField("Item No");
                    Rec.TestField(Description);
                    Rec.TestField("Lot No");
                    Rec.TestField("Supplier No");
                    Rec.TestField("Purchase Order No");
                    Rec.TestField("Manufacturing Date");
                    Rec.TestField("Manufacturing location");

                    QualityInspection.SetRange(
                        "Product Passport Entry No.", Rec."Entry No");

                    if not QualityInspection.FindSet() then
                        Error('No Quality Inspection exists for this Passport.');

                    repeat
                        if QualityInspection."Quality Result" <>
                            QualityInspection."Quality Result"::Passed
                        then
                            Error(
                                'Inspection %1 has not Passed.',
                                QualityInspection."Inspection No");
                    until QualityInspection.Next() = 0;

                    if Rec."Quality Status" <> Rec."Quality Status"::Passed then begin
                        Rec.Validate("Quality Status", Rec."Quality Status"::Passed);
                        Rec.Modify(true);
                    end;

                    Message('Passport validation successful.');
                end;
            }



        }

    }

    var
        MyInt: Integer;
}