table 50101 Teacher
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }


        field(3; "Phone Number"; Text[15])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }




    }

    keys
    {
        key(key1; ID)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}