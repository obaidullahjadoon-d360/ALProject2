codeunit 50141 GeneralPosting
{
    local procedure AmountToFCY(AmountLCY: Decimal; var ServHeader3: Record "Service Header"): Decimal
    var
        CurrExchRate: Record "Currency Exchange Rate";
        Currency: Record Currency;
    begin
        Currency.Get(ServHeader3."Currency Code");
        Currency.TestField("Unit-Amount Rounding Precision");
        exit(
          Round(
            CurrExchRate.ExchangeAmtLCYToFCY(
              ServHeader3."Posting Date", ServHeader3."Currency Code",
              AmountLCY, ServHeader3."Currency Factor"),
            Currency."Unit-Amount Rounding Precision"));
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ServContractManagement", 'OnBeforeServLedgEntryToServiceLine', '', false, false)]

    //        LOCAL procedure OnBeforeServLedgEntryToServiceLine(var Rec : Record "Service Ledger Entry", TotalServLine ,TotalServLineLCY, ServHeader, ServLedgEntry, IsHandled:Boolean, ServiceLedgerEntry)


    local procedure OnBeforeServLedgEntryToServiceLine(var TotalServiceLine: Record "Service Line"; var TotalServiceLineLCY: Record "Service Line"; ServiceHeader: Record "Service Header"; ServiceLedgerEntry: Record "Service Ledger Entry"; ServiceLedgerEntryParm: Record "Service Ledger Entry")
    var
        ServMgtSetup: Record "Service Mgt. Setup";
        ServLineNo: Integer;
        AppliedGLAccount: Code[30];
        StdText: Record "Standard Text";
        IsHandled: Boolean;
        TempServLineDescription: Text[250];
        InvFrom: Record "Service Contract Header";
        InvTo: Record "Service Contract Header";
        ContractNo: Code[20];

    begin
        if IsHandled then
            exit;

        ServLineNo := ServLineNo + 20000;
        with TotalServiceLine do begin
            Reset;
            Init;
            "Document Type" := ServiceHeader."Document Type";
            "Document No." := ServiceHeader."No.";
            "Line No." := ServLineNo;
            "Customer No." := ServiceHeader."Customer No.";
            "Location Code" := ServiceHeader."Location Code";
            "Gen. Bus. Posting Group" := ServiceHeader."Gen. Bus. Posting Group";
            "Transaction Specification" := ServiceHeader."Transaction Specification";
            "Transport Method" := ServiceHeader."Transport Method";
            "Exit Point" := ServiceHeader."Exit Point";
            Area := ServiceHeader.Area;
            "Transaction Specification" := ServiceHeader."Transaction Specification";
            Type := Type::"G/L Account";
            Validate("No.", AppliedGLAccount);
            Validate(Quantity, 1);
            if ServMgtSetup."Contract Inv. Period Text Code" <> '' then begin
                StdText.Get(ServMgtSetup."Contract Inv. Period Text Code");
                TempServLineDescription := StrSubstNo('%1 %2 - %3', StdText.Description, Format(InvFrom), Format(InvTo));
                if StrLen(TempServLineDescription) > MaxStrLen(Description) then
                    Error(
                      //Text013,

                      TableCaption, FieldCaption(Description),
                      StdText.TableCaption, StdText.Code, StdText.FieldCaption(Description),
                      Format(StrLen(TempServLineDescription) - MaxStrLen(Description)));
                Description := CopyStr(TempServLineDescription, 1, MaxStrLen(Description));
            end else
                Description :=
                  StrSubstNo('%1 - %2', Format(InvFrom), Format(InvTo));
            "Contract No." := ContractNo;
            "Appl.-to Service Entry" := ServiceLedgerEntry."Entry No.";
            "Service Item No." := ServiceLedgerEntry."Service Item No. (Serviced)";
            "Unit Cost (LCY)" := ServiceLedgerEntry."Unit Cost";
            "Unit Price" := -ServiceLedgerEntry."Unit Price";

            TotalServiceLine."Unit Price" += "Unit Price";
            TotalServiceLine."Line Amount" += -ServiceLedgerEntry."Amount (LCY)";
            if (ServiceLedgerEntry."Amount (LCY)" <> 0) or (ServiceLedgerEntry."Discount %" > 0) then
                if ServiceHeader."Currency Code" <> '' then begin
                    Validate("Unit Price",
                      AmountToFCY(TotalServiceLine."Unit Price", ServiceHeader) - TotalServiceLineLCY."Unit Price");
                    Validate("Line Amount",
                      AmountToFCY(TotalServiceLine."Line Amount", ServiceHeader) - TotalServiceLineLCY."Line Amount");
                end else begin
                    Validate("Unit Price");
                    Validate("Line Amount", -ServiceLedgerEntry."Amount (LCY)");
                end;
            TotalServiceLineLCY."Unit Price" += "Unit Price";
            TotalServiceLineLCY."Line Amount" += "Line Amount";

            "Shortcut Dimension 1 Code" := ServiceLedgerEntry."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ServiceLedgerEntry."Global Dimension 2 Code";
            "Dimension Set ID" := ServiceLedgerEntry."Dimension Set ID";


        end;
    end;




}
