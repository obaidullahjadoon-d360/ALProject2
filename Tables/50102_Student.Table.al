table 50102 Student
{
    Caption = 'Student';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }


        field(3; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }


        field(4; "E-Mail"; Text[30])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }


        field(5; Website; Text[50])
        {
            Caption = 'Website';
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(6; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(7; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

}
