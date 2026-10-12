table 50404 SetupTab
{
    DataClassification = ToBeClassified;
    caption = 'NextTrace Setup table';

    fields
    {
        field(1; "Primary Key"; code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Enable Traceability"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Auto Create Passport"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Auto Create Passport';
        }
        field(4; "Auto Create Events"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Auto Create Events';
        }
        field(5; "Auto Create Trace Entries"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Auto Create Trace Entries';
        }
        field(6; "Enable Recall Management"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Enable Recall Management';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
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