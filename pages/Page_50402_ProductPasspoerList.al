page 50402 "Product Passport List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Product Passport";
    cardpageid = "Product Passport Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {

                }
                field("Item No"; Rec."Item No")
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
                field("Manufacturing Date"; Rec."Manufacturing Date")
                {

                }
                field("Manufacturing location"; Rec."Manufacturing location")
                {

                }

                field("Supplier No"; Rec."Supplier No")
                {

                }
                field("Purchase Order No"; Rec."Purchase Order No")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field("Quality Status"; Rec."Quality Status")
                {

                }
                field("Created Date"; Rec."Created Date")
                {

                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()

                begin

                end;
            }
        }
    }
}