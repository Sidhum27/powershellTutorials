function Get-Greeting {
    param (
        [string]$Name = "World"
    )

    return "Hello, $Name!"
}
function Get-Age{
    param([int]$age=1 )

    return "hello your age is, $age!"
}

# Call the function
Write-Output (Get-Greeting)
Write-Output (Get-Age -age 2)