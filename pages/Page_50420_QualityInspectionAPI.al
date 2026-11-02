
page 50420 "Quality Inspection API"
{
    PageType = API;

    APIPublisher = 'nextrace';
    APIGroup = 'quality';
    APIVersion = 'v1.0';

    EntityName = 'qualityInspection';
    EntitySetName = 'qualityInspections';

    SourceTable = "Quality Inspection";
    ODataKeyFields = SystemId;

    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'ID';
                    Editable = false;
                }

                field(inspectionNo; Rec."Inspection No")
                {
                    Caption = 'Inspection No';
                }

                field(itemNo; Rec."Item No")
                {
                    Caption = 'Item No';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(lotNo; Rec."Lot No")
                {
                    Caption = 'Lot No';
                }

                field(serialNo; Rec."serial No")
                {
                    Caption = 'Serial No';
                }

                field(inspectionDate; Rec."Inspection Date")
                {
                    Caption = 'Inspection Date';
                }

                field(inspector; Rec.Inspector)
                {
                    Caption = 'Inspector';
                }

                field(qualityResult; Rec."Quality Result")
                {
                    Caption = 'Quality Result';
                }

                field(remark; Rec.Remark)
                {
                    Caption = 'Remark';
                }

                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }

                field(productPassportEntryNo; Rec."Product Passport Entry No.")
                {
                    Caption = 'Product Passport Entry No.';
                }

                field(createdBy; Rec."Created By")
                {
                    Caption = 'Created By';
                    Editable = false;
                }

                field(createdDateTime; Rec."Created Date-Time")
                {
                    Caption = 'Created Date-Time';
                    Editable = false;
                }

                field(completedBy; Rec."Completed By")
                {
                    Caption = 'Completed By';
                    Editable = false;
                }

                field(completedDateTime; Rec."Completed Date-Time")
                {
                    Caption = 'Completed Date-Time';
                    Editable = false;
                }
            }
        }
    }
}
