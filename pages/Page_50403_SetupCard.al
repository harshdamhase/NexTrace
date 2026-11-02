page 50403 "NextTrace Setup page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SetupTab;
    Caption = 'Product Traceability Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the setup record key.';
                }

                field("Enable Traceability"; Rec."Enable Traceability")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether product traceability is enabled.';
                }

                field("Auto Create Passport"; Rec."Auto Create Passport")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether Product Passports are created automatically.';
                }

                field("Auto Create Trace Entries"; Rec."Auto Create Trace Entries")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether traceability entries are created automatically.';
                }

                field("Auto Create Events"; Rec."Auto Create Events")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether product lifecycle events are created automatically.';
                }

                field("Enable Recall Management"; Rec."Enable Recall Management")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether recall management is enabled.';
                }
            }
        }
    }


    trigger OnOpenPage()
    begin
        if not Rec.Get('SETUP') then begin
            Rec.Init();
            Rec."Primary Key" := 'SETUP';
            Rec."Enable Traceability" := true;
            Rec."Auto Create Events" := true;
            Rec."Auto Create Passport" := true;
            Rec."Auto Create Trace Entries" := true;
            Rec."Enable Recall Management" := true;
            Rec.Insert();
        end;
    end;



    var
        myInt: Integer;
}