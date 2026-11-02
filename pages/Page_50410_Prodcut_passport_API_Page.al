page 50410 "Product Passport API Page"
{
    PageType = API;
    Caption = 'Product Passport API';
    APIPublisher = 'nextrace';
    APIGroup = 'traceability';
    APIVersion = 'v1.0';
    EntityName = 'productPassport';
    EntitySetName = 'productPassports';
    SourceTable = "Product Passport";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field("EntryNo"; Rec."Entry No")
                {

                }
                field("ItemNo"; Rec."Item No")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field("LotNo"; Rec."Lot No")
                {

                }
                field("SerialNo"; Rec."Serial No")
                {

                }
                field("ManufacturingDate"; Rec."Manufacturing Date")
                {

                }
                field("Manufacturinglocation"; Rec."Manufacturing location")
                {

                }
                field("CountryofOrigin"; Rec."Country of Origin")
                {

                }
                field("SupplierNo"; Rec."Supplier No")
                {

                }
                field(PurchaseOrderNo; Rec."Purchase Order No")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field(qualityStatus; Rec."Quality Status")
                {

                }
                field(CreatedDate; Rec."Created Date")
                {

                }
            }
        }
    }
}