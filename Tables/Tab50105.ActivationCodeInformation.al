table 50105 "Activation Code Information "
{
    Caption = 'Activation Code Information ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Activation Code"; Text[14])
        {
            Caption = 'Activation Code';
            DataClassification = ToBeClassified;
            Description = 'Activation code used to aactivate customer reward';
        }
        field(2; "Data Activated"; Date)
        {
            Caption = 'Data Activated';
            DataClassification = ToBeClassified;
            Description = 'Date Customer reward was activated';
        }
        field(3; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
            DataClassification = ToBeClassified;
            Description = 'Date Customer Rewards activation expires';
        }
    }
    keys
    {
        key(PK; "Activation Code")
        {
            Clustered = true;
        }
    }

}
