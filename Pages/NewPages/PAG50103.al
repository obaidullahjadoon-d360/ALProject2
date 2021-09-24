pageextension 50105 pageextension50105 extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst("&Customer")
        {
            action("Reward Levels")
            {
                ApplicationArea = All;
                Image = CustomerRating;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open the list of reward levels.';


            }
        }
    }
}