# Freddie Mac Single Family Loan-Level Dataset

## Getting the Data

* [Data Source](http://www.freddiemac.com/news/finance/sf_loanlevel_dataset.html)
* Request a login, receive an e-mail, login
* (Optional: Download `READ_ME.zip` - contains the dataset overview, file layout and data dictionary information)
* Download dataset files similar to `historical_data1_Q22015.zip`
* Uncompress, then the file similar to `historical_data1_time_QnYYYY.txt` is the monthly loan performance data

## Monthly Loan Performance Data Format

Header is not included in the data file. According to the data dictionary `READ_ME` the header should be similar to:

```
LoanSequenceNumber|MonthlyReportingPeriod|CurrentActualUpb|CurrentLoadDelinquencyStatus|LoanAge|RemainingMonthsToLegalMaturity|RepurchaseFlag|ModificationFlag|ZeroBalanceCode|ZeroBalanceEffectiveDate|CurrentInterestRate|CurrentDeferredUpb|DueDateOfLastPaidInstallment|MiRecoveries|NetSalesProceeds|NonMiRecoveries|Expenses|LegalCosts|MaintenanceAndPreservationCosts|TaxesAndInsurance|MiscellaneousExpenses|ActualLossCalculation
```

The field types should be similar to:

```sh
> csv-analyze --detect-column-types=1 --delimiter="|" /Users/mike/Downloads/historical_data1_Q22015/historical_data1_time_Q22015.txt 
String,Number,String,Number,Number,Number,String,String,String,String,Number,Bool,String,String,String,String,String,String,String,String,String,String
```

The primary key for the data appears to be `LoanSequenceNumber` combined with `MonthlyReportingPeriod`:

```sh
> csv-analyze --detect-pk=1 --num-fields-pk=2 --delimiter="|" --header="LoanSequenceNumber|MonthlyReportingPeriod|CurrentActualUpb|CurrentLoadDelinquencyStatus|LoanAge|RemainingMonthsToLegalMaturity|RepurchaseFlag|ModificationFlag|ZeroBalanceCode|ZeroBalanceEffectiveDate|CurrentInterestRate|CurrentDeferredUpb|DueDateOfLastPaidInstallment|MiRecoveries|NetSalesProceeds|NonMiRecoveries|Expenses|LegalCosts|MaintenanceAndPreservationCosts|TaxesAndInsurance|MiscellaneousExpenses|ActualLossCalculation" /Users/mike/Downloads/historical_data1_Q22015/historical_data1_time_Q22015.txt 
LoanSequenceNumber,MonthlyReportingPeriod
LoanSequenceNumber,LoanAge
LoanSequenceNumber,RemainingMonthsToLegalMaturity
```

## Importing the Data into Noms

Importing into a Noms List via csv-import:

```sh
> csv-import --delimiter="|" --header="LoanSequenceNumber|MonthlyReportingPeriod|CurrentActualUpb|CurrentLoadDelinquencyStatus|LoanAge|RemainingMonthsToLegalMaturity|RepurchaseFlag|ModificationFlag|ZeroBalanceCode|ZeroBalanceEffectiveDate|CurrentInterestRate|CurrentDeferredUpb|DueDateOfLastPaidInstallment|MiRecoveries|NetSalesProceeds|NonMiRecoveries|Expenses|LegalCosts|MaintenanceAndPreservationCosts|TaxesAndInsurance|MiscellaneousExpenses|ActualLossCalculation" --column-types="String,Number,String,Number,Number,Number,String,String,String,String,Number,Bool,String,String,String,String,String,String,String,String,String,String" ~/Downloads/historical_data1_Q22015/historical_data1_time_Q22015.txt http://localhost:8000::fmlist
```

Importing into a Noms nested-Map via csv-import:

```sh
> csv-import --dest-type=map:LoanSequenceNumber,MonthlyReportingPeriod --delimiter="|" --header="LoanSequenceNumber|MonthlyReportingPeriod|CurrentActualUpb|CurrentLoadDelinquencyStatus|LoanAge|RemainingMonthsToLegalMaturity|RepurchaseFlag|ModificationFlag|ZeroBalanceCode|ZeroBalanceEffectiveDate|CurrentInterestRate|CurrentDeferredUpb|DueDateOfLastPaidInstallment|MiRecoveries|NetSalesProceeds|NonMiRecoveries|Expenses|LegalCosts|MaintenanceAndPreservationCosts|TaxesAndInsurance|MiscellaneousExpenses|ActualLossCalculation" --column-types="String,Number,String,Number,Number,Number,String,String,String,String,Number,Bool,String,String,String,String,String,String,String,String,String,String" ~/Downloads/historical_data1_Q22015/historical_data1_time_Q22015.txt http://localhost:8000::fmmap
```

Let's look at the data now:

```sh
> noms show http://localhost:8000::fmmap
struct Commit {
  meta: struct Meta {
    date: String,
    inputFile: String,
  },
  parents: Set<Ref<Cycle<0>>>,
  value: Map<String, Map<Number, struct Row {
    ActualLossCalculation: String,
    CurrentActualUpb: String,
    CurrentDeferredUpb: Bool,
    CurrentInterestRate: Number,
    CurrentLoadDelinquencyStatus: Number,
    DueDateOfLastPaidInstallment: String,
    Expenses: String,
    LegalCosts: String,
    LoanAge: Number,
    LoanSequenceNumber: String,
    MaintenanceAndPreservationCosts: String,
    MiRecoveries: String,
    MiscellaneousExpenses: String,
    ModificationFlag: String,
    MonthlyReportingPeriod: Number,
    NetSalesProceeds: String,
    NonMiRecoveries: String,
    RemainingMonthsToLegalMaturity: Number,
    RepurchaseFlag: String,
    TaxesAndInsurance: String,
    ZeroBalanceCode: String,
    ZeroBalanceEffectiveDate: String,
  }>>,
}({
  meta: Meta {
    date: "2016-08-25T14:04:07+0000",
    inputFile: "/Users/mike/Downloads/fmloans-data/historical_data1_Q22015/historical_data1_time_Q22015.txt",
  },
  parents: {},
  value: {  // 361,038 items
    "F115Q2000001": {  // 8 items
      201505: Row {
        ActualLossCalculation: "",
        CurrentActualUpb: "",
        CurrentDeferredUpb: false,
        CurrentInterestRate: 3.5,
        CurrentLoadDelinquencyStatus: 0,
        DueDateOfLastPaidInstallment: "",
        Expenses: "",
        LegalCosts: "",
        LoanAge: 0,
        LoanSequenceNumber: "F115Q2000001",
        MaintenanceAndPreservationCosts: "",
        MiRecoveries: "",
        MiscellaneousExpenses: "",
        ModificationFlag: "",
        MonthlyReportingPeriod: 201505,
        NetSalesProceeds: "",
        NonMiRecoveries: "",
        RemainingMonthsToLegalMaturity: 180,
        RepurchaseFlag: "",
        TaxesAndInsurance: "",
        ZeroBalanceCode: "",
        ZeroBalanceEffectiveDate: "",
      },
      201506: Row {
        ActualLossCalculation: "",
        CurrentActualUpb: "",
        CurrentDeferredUpb: false,
        CurrentInterestRate: 3.5,
        CurrentLoadDelinquencyStatus: 0,
        DueDateOfLastPaidInstallment: "",
        Expenses: "",
        LegalCosts: "",
        LoanAge: 1,
        LoanSequenceNumber: "F115Q2000001",
        MaintenanceAndPreservationCosts: "",
        MiRecoveries: "",
        MiscellaneousExpenses: "",
        ModificationFlag: "",
        MonthlyReportingPeriod: 201506,
        NetSalesProceeds: "",
        NonMiRecoveries: "",
        RemainingMonthsToLegalMaturity: 179,
        RepurchaseFlag: "",
        TaxesAndInsurance: "",
        ZeroBalanceCode: "",
        ZeroBalanceEffectiveDate: "",
      },
...
```

This output let's us know the data file had 361,038 unique `LoanSequenceNumbers`, and for `LoanSequenceNumber == "F115Q2000001"` the data file contained 8 unique `MonthlyReportingPeriods`.
