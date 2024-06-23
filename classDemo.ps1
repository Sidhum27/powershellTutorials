class Car {
    [string]$Make
    [string]$Model
    [int]$Year

    Car([string]$make, [string]$model, [int]$year) {
        $this.Make = $make
        $this.Model = $model
        $this.Year = $year
    }

    [void] DisplayDetails() {
        Write-Output "Car Details: $($this.Year) $($this.Make) $($this.Model)"
    }

    [int] CalculateAge() {
        $currentYear = (Get-Date).Year
        return $currentYear - $this.Year
    }
}

# Create an instance of the class
$car = [Car]::new("Toyota", "Camry", 2015)

# Call methods
$car.DisplayDetails()
$carAge = $car.CalculateAge()
Write-Output "Car Age: $carAge years"
