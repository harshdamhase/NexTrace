
table 50406 "Quality Inspection"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Inspection No"; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(2; "Item No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                RecItem: Record Item;
            begin
                if "Item No" = '' then begin
                    Description := '';
                    exit;
                end;

                if RecItem.Get("Item No") then
                    Description := RecItem.Description;
            end;
        }

        field(3; Description; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Lot No"; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(5; "serial No"; code[50])
        {
            DataClassification = ToBeClassified;

        }

        field(6; "Inspection Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(7; Inspector; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(8; "Quality Result"; Enum "Quality Result")
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdateProductPassportQualityStatus();
            end;
        }

        field(9; Remark; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(10; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }

        field(11; "Product Passport Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "Product Passport"."Entry No";
        }

        field(12; "Created By"; Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }

        field(13; "Created Date-Time"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(14; "Completed By"; Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }

        field(15; "Completed Date-Time"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Inspection No")
        {
            Clustered = true;
        }

        key(PassportKey; "Product Passport Entry No.")
        {
        }
    }

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        if "Inspection No" = '' then begin
            if "No. Series" = '' then
                "No. Series" := 'QINSPECT';

            "Inspection No" :=
                NoSeries.GetNextNo("No. Series", Today);
        end;

        if "Created By" = '' then
            "Created By" :=
                CopyStr(UserId(), 1, MaxStrLen("Created By"));

        if "Created Date-Time" = 0DT then
            "Created Date-Time" := CurrentDateTime();

        if "Inspection Date" = 0D then
            "Inspection Date" := Today;

        ValidatePassportLink();
    end;

    trigger OnModify()
    begin
        if xRec."Quality Result" <> "Quality Result" then begin
            UpdateProductPassportQualityStatus();

            if "Quality Result" in
                ["Quality Result"::Passed,
                 "Quality Result"::Failed,
                 "Quality Result"::"On Hold"]
            then begin
                "Completed By" :=
                    CopyStr(UserId(), 1, MaxStrLen("Completed By"));
                "Completed Date-Time" := CurrentDateTime();
            end else begin
                "Completed By" := '';
                "Completed Date-Time" := 0DT;
            end;
        end;
    end;

    local procedure ValidatePassportLink()
    var
        ProductPassport: Record "Product Passport";
    begin
        if "Product Passport Entry No." = 0 then
            Error('Product Passport Entry No. must be specified.');

        ProductPassport.SetRange("Entry No", "Product Passport Entry No.");
        if not ProductPassport.FindFirst() then
            Error(
                'Passport Entry No. %1 was not found. Verify the Product Passport primary key and saved record.',
                "Product Passport Entry No.");

        if ProductPassport."Item No" <> "Item No" then
            Error(
                'Inspection Item No. %1 does not match Passport Item No. %2.',
                "Item No",
                ProductPassport."Item No");
    end;

    local procedure UpdateProductPassportQualityStatus()
    var
        ProductPassport: Record "Product Passport";
    begin
        // Find the linked Product Passport using Entry No.
        if "Product Passport Entry No." = 0 then
            exit;

        ProductPassport.SetRange("Entry No", "Product Passport Entry No.");
        if not ProductPassport.FindFirst() then
            Error(
                'Product Passport Entry No. %1 was not found.',
                "Product Passport Entry No.");

        // Update Product Passport Quality Status.
        case "Quality Result" of
            "Quality Result"::Pending:
                ProductPassport."Quality Status" :=
                    ProductPassport."Quality Status"::Pending;

            "Quality Result"::Passed:
                ProductPassport."Quality Status" :=
                    ProductPassport."Quality Status"::Passed;

            "Quality Result"::Failed,
            "Quality Result"::"On Hold":
                ProductPassport."Quality Status" :=
                    ProductPassport."Quality Status"::"Hold on";
        end;

        ProductPassport.Modify(true);
    end;
}
