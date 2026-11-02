table 50405 "Tracibility Entry"
{
    DataClassification = ToBeClassified;
    caption = 'Tracibility Entry';

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Trace Type"; Text[100])
        {
            Dataclassification = tobeclassified;
        }
        field(3; "Source Type"; Text[100])
        {
            Dataclassification = tobeclassified;
        }

        field(4; "Source Document No"; Code[40])
        {
            Dataclassification = tobeclassified;
        }
        field(5; "Source Item No."; code[20])
        {
            Dataclassification = tobeclassified;
            Caption = 'Source Item No.';
            TableRelation = Item."No.";
        }
        field(6; "Source Lot No."; Code[50])
        {
            Caption = 'Source Lot No.';
            DataClassification = CustomerContent;
        }
        field(7; "Source Serial No"; Code[50])
        {
            Caption = 'Source Serial No.';
            DataClassification = CustomerContent;
        }
        field(8; "Destination Type"; text[100])
        {
            Dataclassification = tobeclassified;
        }
        field(9; "Destination Document No"; code[40])
        {
            Dataclassification = tobeclassified;
        }
        field(10; "Destination Item No"; code[20])
        {
            Dataclassification = tobeclassified;
            TableRelation = Item."No.";
        }
        field(11; "Destination Lot No."; Code[50])
        {
            Caption = 'Destination Lot No.';
            DataClassification = CustomerContent;
        }
        field(12; "Destination Serial No."; Code[50])
        {
            Caption = 'Destination Serial No.';
            DataClassification = CustomerContent;
        }
        field(13; "Quantity"; decimal)
        {
            Dataclassification = tobeclassified;
        }
        field(14; "Location Code"; code[20])
        {
            Dataclassification = tobeclassified;
            TableRelation = Location.Code;
        }
        field(15; "Posting Date"; date)
        {
            Dataclassification = tobeclassified;
        }
        field(16; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Unit of Measure".Code;
        }

        field(17; "Created Date-Time"; DateTime)
        {
            Caption = 'Created Date-Time';
        }

        field(18; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}