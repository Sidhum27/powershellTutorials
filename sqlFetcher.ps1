class SqlDataFetcher {
    [string]$ServerName
    [string]$DatabaseName

    SqlDataFetcher([string]$serverName, [string]$databaseName) {
        $this.ServerName = $serverName
        $this.DatabaseName = $databaseName
    }

    [void] EnsureModule([string]$moduleName) {
        if (-not (Get-Module -ListAvailable -Name $moduleName)) {
            Write-Output "$moduleName module not found. Installing..."
            Install-Module -Name $moduleName -Force -Scope CurrentUser
        } else {
            Write-Output "$moduleName module is already installed."
        }
    }

    [object[]] FetchData([string]$tableName) {
        # Ensure the SqlServer module is installed
        $this.EnsureModule("SqlServer")

        # Import the SqlServer module
        Import-Module SqlServer

        # Define the SQL query to fetch data
        $query = "SELECT * FROM $tableName"
        
        # Execute the SQL query using Invoke-Sqlcmd
        try {
            $result = Invoke-Sqlcmd -ServerInstance $this.ServerName -Database $this.DatabaseName -Query $query
            
            # Check if the result is not null or empty
            if ($null -ne $result) {
                return $result
            } else {
                Write-Output "No data found in $tableName."
                return @()
            }
        } catch {
            # Catch and display any errors
            Write-Error "An error occurred while fetching data from $tableName : $_"
            return @()
        }
    }
}

# Create an instance of the class
$sqlFetcher = [SqlDataFetcher]::new("your_server_name", "your_database_name")

# Fetch data from a specific table
$data = $sqlFetcher.FetchData("your_table_name")

# Display the fetched data
if ($data.Count -gt 0) {
    $data | Format-Table -AutoSize
}
