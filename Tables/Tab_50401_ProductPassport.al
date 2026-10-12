table 50401 "Product Passport"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Dataclassification = ToBeClassified;
        }
        field(4; "Lot No"; Code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(5; "Serial No"; Code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(6; "Manufacturing Date"; date)
        {
            Dataclassification = tobeclassified;
        }
        field(7; "Manufacturing location"; text[100])
        {
            dataclassification = Tobeclassified;
        }
        field(8; "Country of Origin"; text[100])
        {
            Dataclassification = tobeclassified;
        }
        field(9; "Supplier No"; Code[20])
        {
            Dataclassification = Tobeclassified;
        }
        field(10; "Purchase Order No"; Code[20])
        {
            Dataclassification = tobeclassified;
        }
        field(11; "Status"; Enum "Passport Status")
        {
            Dataclassification = tobeclassified;
        }
        field(12; "Quality Status"; Enum "Quality Status")
        {
            Dataclassification = Tobeclassified;

        }
        field(13; "Created Date"; date)
        {
            Dataclassification = tobeclassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Item No")
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