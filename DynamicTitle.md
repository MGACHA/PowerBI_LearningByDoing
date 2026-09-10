1. Create the parameter as a numeric range:
![Parameter](images/CreateParameter.png)

2. Add a column to a table:
``` dax
ParName = "Top" & TopN'[TopN]
```

![RangeColumn](images/ParameterNewColumn.png)

4. Create a Measure:
![CreateMeasure](images/CreateMeasure.png)

``` dax
Dynamic Visual Title = 
-- 1. Get Selected Top N Value
VAR SelectedTop = SELECTEDVALUE('TopN'[TopN])
VAR CleanTop = 
    IF(
        ISBLANK(SelectedTop), 
        "All", 
        IF(CONTAINSSTRING(SelectedTop, "Top"), SelectedTop, "Top " & SelectedTop)
    )
-- 2. Get Selected Region
VAR SelectedRegion = SELECTEDVALUE('sales_data_cleaned'[region])
VAR RegionText = 
    IF(
        ISBLANK(SelectedRegion), 
        "across All Regions", 
        "in " & SelectedRegion
    )
RETURN CleanTop & " Product " & RegionText

```
