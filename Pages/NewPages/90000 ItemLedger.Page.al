pageextension 50140 ItemLedgerEntry extends "Item Ledger Entries"
{
    layout
    {
        addafter("Entry Type")
        {
            field("Reason"; "Reason")
            {
                //DataClassification = ToBeClassified;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}