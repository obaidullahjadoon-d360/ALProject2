page 50102 "Reward Level List"
{

    Caption = 'Reward Level List';
    PageType = List;
    SourceTable = "Reward level";
    ContextSensitiveHelpPage = 'sales-rewards';
    SourceTableView = sorting("Minimum Reward points") order(ascending);
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(level; Rec.level)
                {
                    ToolTip = 'Specifies the value of the level field';
                    ApplicationArea = All;
                }
                field("Minimum Reward points"; Rec."Minimum Reward points")
                {
                    ToolTip = 'Specifies the value of the Minimum Reward points field';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin

        //if not CustomerRewardsExtMgt.IsCustomerRewardsActivated then
        // Error(NotActivatedTxt);
    end;

    var
    //CustomerRewardsExtMgt: Codeunit "CustomerRewardsExt.Mgt.";
    //NotActivatedTxt: Label 'Customer Rewards is not activated';



}
