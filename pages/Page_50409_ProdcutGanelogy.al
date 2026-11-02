page 50409 "Product Ganelogy"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = ;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ItemNo; ItemNo)
                {

                }
                field(LotNo; LotNo)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(BackWardTrace)
            {
                Caption = 'Back Word Trace';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    GeneologyMgt: Codeunit "Genealogy Management";
                begin
                    GeneologyMgt.GetBackwardTrace(ItemNo, LotNo);
                end;
            }
            action(forwardTrace)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    GeneologyMgt: Codeunit "Genealogy Management";

                begin
                    GeneologyMgt.GetForwardTrace(ItemNo, LotNo);
                end;
            }
        }
    }

    var
        myInt: Integer;
        ItemNo: Code[20];
        LotNo: Code[20];
}