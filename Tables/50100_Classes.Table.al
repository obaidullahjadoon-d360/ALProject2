table 50100 classes
{
    DataClassification = ToBeClassified;
    Caption = 'Class';
    Description = 'A calss table that contains information of all classes';

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }


        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }


        field(3; Active; Boolean)
        {
            DataClassification = ToBeClassified;
        }


        field(4; Mode; Option)
        {
            OptionMembers = "",Live,"On demand";
            OptionCaption = ',live,on demand';
        }


        field(5; Fee; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    Keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    var
    begin

    end;


    trigger OnDelete()
    var
    begin

    end;

    trigger OnModify()
    var
    begin

    end;

    trigger OnRename()
    var
    begin

    end;

    var

        i: Integer;

}







