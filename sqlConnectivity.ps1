# Fetch-SqlData.ps1

# Function to check if a module is installed
 function Install-Moduleifneeded (
        [string]$ModuleName)
    {
    if (-not (Get-Module -ListAvailable -Name $ModuleName)) {
        Write-Output "$ModuleName module not found. Installing..."
        Install-Module -Name $ModuleName -Force -Scope CurrentUser
    } else {
        Write-Output "$ModuleName module is already installed."
    }
}

# Ensure the SqlServer module is installed
Ensure-Module -ModuleName "SqlServer"

# Import the SqlServer module
Import-Module SqlServer

# Define SQL Server connection parameters
$serverName = "your_server_name"
$databaseName = "your_database_name"
$tableName = "your_table_name"

# Define the SQL query to fetch data
$query = "SELECT * FROM $tableName"

# Execute the SQL query using Invoke-Sqlcmd
try {
    $result = Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Query $query

    # Check if the result is not null or empty
    if ($null -ne $result) {
        # Output the results
        $result | Format-Table -AutoSize
    } else {
        Write-Output "No data found."
    }
} catch {
    # Catch and display any errors
    Write-Error "An error occurred: $_"
}
