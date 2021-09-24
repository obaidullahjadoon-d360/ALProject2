page 50100 "class List"
{
    Pagetype = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Classes;

    layout
    {

        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(Active; Rec.Active)
                {
                    ApplicationArea = All;

                }

                field(Mode; Rec.Mode)
                {
                    ApplicationArea = A;

                }




            }
        }




    }


}