/*`Text.Trim` removes extra spaces
`Text.Lower` standardises text for consistent comparison
The `if...else` logic assigns numeric values based on cleaned input
*/


let
    RiskClean = Text.Lower( Text.Trim( [Risk] ) )
in
    if RiskClean = "risk" then 1
    else if RiskClean = "no risk" then 0
    else null
