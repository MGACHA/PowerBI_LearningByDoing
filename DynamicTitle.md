1. Create the parameter as a numeric range:

2. Add a column to a table:

3. Create a Measure:

-- dax
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

--
