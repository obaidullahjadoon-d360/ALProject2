tableextension 50100 "CustomerTable Ext." extends Customer
{
    fields
    {
        field(10001; RewardPoints; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Reward Points';
            MinValue = 0;
        }


        field(10002; RewardLevel; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Reward Points';
            MinValue = 0;
        }
    }
}