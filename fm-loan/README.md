# Freddie Mac Single Family Loan-Level Dataset

## Getting the Data

* [Data Source](http://www.freddiemac.com/news/finance/sf_loanlevel_dataset.html)
* Request a login, receive an e-mail, login
* (Optional: Download `READ_ME.zip` - contains the dataset overview, file layout and data dictionary information)
* Download dataset files similar to `historical_data1_Q22015.zip`
* Uncompress, then the file similar to `historical_data1_time_QnYYYY.txt` is the monthly loan performance data

## Monthly Loan Performance Data Format:

Header is not included in the data file. According to the data dictionary `READ_ME` the header should be similar to:

```
LoanSequenceNumber|MonthlyReportingPeriod|CurrentActualUpb|CurrentLoadDelinquencyStatus|LoanAge|RemainingMonthsToLegalMaturity|RepurchaseFlag|ModificationFlag|ZeroBalanceCode|ZeroBalanceEffectiveDate|CurrentInterestRate|CurrentDeferredUpb|DueDateOfLastPaidInstallment|MiRecoveries|NetSalesProceeds|NonMiRecoveries|Expenses|LegalCosts|MaintenanceAndPreservationCosts|TaxesAndInsurance|MiscellaneousExpenses|ActualLossCalculation
```

The field types should be similar to:

```
> csv-analyze --detect-column-types=1 --delimiter="|" /Users/mike/Downloads/historical_data1_Q22015/historical_data1_time_Q22015.txt 
String,Number,String,Number,Number,Number,String,String,String,String,Number,Bool,String,String,String,String,String,String,String,String,String,String
```

The primary key for the data appears to be `LoanSequenceNumber` combined with `MonthlyReportingPeriod`:

```
> csv-analyze --detect-pk=1 --num-fields-pk=2 --delimiter="|" --header="LoanSequenceNumber|MonthlyReportingPeriod|CurrentActualUpb|CurrentLoadDelinquencyStatus|LoanAge|RemainingMonthsToLegalMaturity|RepurchaseFlag|ModificationFlag|ZeroBalanceCode|ZeroBalanceEffectiveDate|CurrentInterestRate|CurrentDeferredUpb|DueDateOfLastPaidInstallment|MiRecoveries|NetSalesProceeds|NonMiRecoveries|Expenses|LegalCosts|MaintenanceAndPreservationCosts|TaxesAndInsurance|MiscellaneousExpenses|ActualLossCalculation" /Users/mike/Downloads/historical_data1_Q22015/historical_data1_time_Q22015.txt 
LoanSequenceNumber,MonthlyReportingPeriod
LoanSequenceNumber,LoanAge
LoanSequenceNumber,RemainingMonthsToLegalMaturity
```

