table 50406 "Quality Inspection"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Inspection No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(3; Description; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Lot No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "serial No"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Inspection Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Inspector"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Quality Result"; Enum "Quality Result")
        {
            DataClassification = ToBeClassified;
        }
        field(9; Remark; text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Inspection No")
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