pageextension 50104 "Customer card Ext." extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(Rewardlevel; Rewardlevel)
            {
                ApplicationArea = All;
                Caption = 'Reward Level';
                Description = 'Reward level of the customer.';
                ToolTip = 'Specifies the level of reward that the customer has at this point.';
                Editable = false;
            }
            field(RewardPoints; RewardPoints)
            {
                ApplicationArea = All;
                Caption = 'Reward Points';
                Description = 'Reward points accrued by customer';
                ToolTip = 'Specifies the total number of points that the customer has at this point.';
                Editable = false;
            }
        }
    }


    trigger OnAfterGetCurrRecord()
    var
    //CustomerRewardsMgtSetup:Codeunit "CustomerRewardsMgt.Setup";
    begin
        //RewardLevel:=CustomerRewardMgtSetup.GetRewardLevel(RewardPoints);
    end;

    var
        RewardLevel: Text;

}