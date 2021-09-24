table 50103 ClassSchedule
{
    Caption = 'ClassSchedule';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; T_ID; Integer)
        {
            Caption = 'T_ID';
            DataClassification = ToBeClassified;
            //TableRelation = Teacher;






        }
        field(2; "line No."; Integer)
        {
            Caption = 'line No.';
            DataClassification = ToBeClassified;
        }
        field(3; ClassID; Integer)
        {
            Caption = 'ClassID';
            DataClassification = ToBeClassified;
            TableRelation = classes;
        }
        field(4; "Schedule day"; Option)
        {
            Caption = 'Schedule day';
            DataClassification = ToBeClassified;
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday;
        }
        field(5; "Schedulae Date"; Date)
        {
            Caption = 'Schedulae Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Duration"; Decimal)
        {
            Caption = 'Duration';
            DataClassification = ToBeClassified;
        }
        field(7; "Schedule End time"; Time)
        {
            Caption = 'Schedule End time';
            DataClassification = ToBeClassified;
        }

        field(8; "Teacher Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(9; "Class Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(Key1; "T_ID", "line No.")
        {
            Clustered = true;
        }
    }

}
