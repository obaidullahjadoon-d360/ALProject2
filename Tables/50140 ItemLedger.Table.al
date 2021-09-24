tableextension 50140 ItemLedger extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Reason"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reason Code';
        }
    }

    var
        myInt: Integer;
}