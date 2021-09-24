table 50104 "Reward level"
{
    Caption = 'Reward level';
    TableType = Normal;
    DataClassification = CustomerContent;

    fields
    {
        field(1; level; Text[20])
        {
            Caption = 'level';
            DataClassification = CustomerContent;


        }
        field(2; "Minimum Reward points"; Integer)
        {
            Caption = 'Minimum Reward points';
            DataClassification = CustomerContent;
            MinValue = 0;
            NotBlank = true;


            trigger OnValidate();
            var
                tempPoints: Integer;
                RewardLevel: Record "Reward Level";
            begin
                tempPoints := "Minimum Reward Points";
                RewardLevel.SetRange("Minimum Reward Points", tempPoints);
                if RewardLevel.FindFirst then
                    Error('Minimum reward points must be unique');
            end;



        }
    }
    keys
    {
        key(PK; level)
        {
            Clustered = true;
        }
        key("Minimum Reward Points"; "Minimum Reward points") { }
    }

    trigger OnInsert();
    begin
        Validate("Minimum Reward Points");
    end;

    trigger OnModify();
    begin
        Validate("Minimum Reward points");
    end;






}
