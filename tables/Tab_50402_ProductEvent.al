table 50402 "Product Event"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Passport Entry No"; Code[20])
        {
            Dataclassification = tobeclassified;

        }
        field(3; "Event Type"; Enum "Event Type")
        {
            Dataclassification = tobeclassified;
        }
        field(4; "Document No"; Code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(5; "Item No"; Code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(6; "Lot No"; Code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(7; "Location code"; code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(8; "Event Date"; Date)
        {
            Dataclassification = tobeclassified;
        }
        field(9; "User Id"; code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(10; "Description"; Text[100])
        {
            Dataclassification = tobeclassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Passport Entry No")
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