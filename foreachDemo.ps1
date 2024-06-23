# Define a list of items
$list = @('Item1', 'Item2', 'Item3', 'Item4')

# Iterate over each item using ForEach-Object
# $list | ForEach-Object {
#     Write-Output "Processing $_"
# }

foreach ($item in $list) {
    $item +=" test"
    Write-Output "Processing $item"
}