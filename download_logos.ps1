# PowerShell script to download company logos

# Create logos directory if it doesn't exist
$logosDir = "logos"
if (-not (Test-Path $logosDir)) {
    New-Item -ItemType Directory -Path $logosDir
}

# Function to download a file
function Download-File {
    param (
        [string]$url,
        [string]$outputFile
    )
    
    try {
        Write-Host "Downloading $url to $outputFile..."
        Invoke-WebRequest -Uri $url -OutFile $outputFile
        Write-Host "Downloaded successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to download $url. Error: $_" -ForegroundColor Red
    }
}

# List of logos to download (name, URL)
$logos = @(
    @{name="herbalife.svg"; url="https://seeklogo.com/files/H/herbalife-logo-C44D3C9595-seeklogo.com.svg"},
    @{name="metro.svg"; url="https://seeklogo.com/files/M/metro-logo-C49292F2A4-seeklogo.com.svg"},
    @{name="emag.svg"; url="https://seeklogo.com/files/E/emag-logo-4AA15FF3F3-seeklogo.com.svg"},
    @{name="jackjones.svg"; url="https://seeklogo.com/files/J/jack-jones-logo-0EA7D20E6E-seeklogo.com.svg"},
    @{name="zara.svg"; url="https://seeklogo.com/files/Z/zara-logo-21BD7E8BFF-seeklogo.com.svg"},
    @{name="pepsico.svg"; url="https://seeklogo.com/files/P/pepsico-logo-BD59FFEAFE-seeklogo.com.svg"},
    @{name="decathlon.svg"; url="https://seeklogo.com/files/D/decathlon-logo-47A65E3BE7-seeklogo.com.svg"},
    @{name="larsentoubro.svg"; url="https://seeklogo.com/files/L/larsen-toubro-logo-51DCAFE2B8-seeklogo.com.svg"},
    @{name="forever21.svg"; url="https://seeklogo.com/files/F/forever-21-logo-2A05BFF04F-seeklogo.com.svg"},
    @{name="sabyasachi.svg"; url="https://seeklogo.com/files/S/sabyasachi-logo-AE37B379AD-seeklogo.com.svg"},
    @{name="bacardi.svg"; url="https://seeklogo.com/files/B/bacardi-logo-C14DF54A01-seeklogo.com.svg"},
    @{name="carrefour.svg"; url="https://seeklogo.com/files/C/carrefour-logo-39F5031B63-seeklogo.com.svg"},
    @{name="bosch.svg"; url="https://seeklogo.com/files/B/bosch-logo-4A46AE9343-seeklogo.com.svg"},
    @{name="budweiser.svg"; url="https://seeklogo.com/files/B/budweiser-logo-CAFBE9233D-seeklogo.com.svg"},
    @{name="infosys.svg"; url="https://seeklogo.com/files/I/infosys-logo-A76CC66198-seeklogo.com.svg"},
    @{name="hsbc.svg"; url="https://seeklogo.com/files/H/hsbc-logo-D546105456-seeklogo.com.svg"},
    @{name="nescafe.svg"; url="https://seeklogo.com/files/N/nescafe-logo-8256D385F0-seeklogo.com.svg"},
    @{name="gillette.svg"; url="https://seeklogo.com/files/G/gillette-logo-DDC56D1562-seeklogo.com.svg"},
    @{name="ipl.svg"; url="https://seeklogo.com/files/I/indian-premier-league-logo-BDB0B1B41D-seeklogo.com.svg"},
    @{name="nba.svg"; url="https://seeklogo.com/files/N/nba-logo-799C966D6E-seeklogo.com.svg"},
    @{name="mindtree.svg"; url="https://seeklogo.com/files/M/mindtree-logo-BAB5F70508-seeklogo.com.svg"},
    @{name="3m.svg"; url="https://seeklogo.com/files/3/3m-logo-4E7FDA8C0C-seeklogo.com.svg"},
    @{name="greygoose.svg"; url="https://seeklogo.com/files/G/grey-goose-logo-43AE5D7767-seeklogo.com.svg"},
    @{name="hul.svg"; url="https://seeklogo.com/files/H/hindustan-unilever-limited-logo-28C3F3E8D0-seeklogo.com.svg"},
    @{name="jwmarriott.svg"; url="https://seeklogo.com/files/J/jw-marriott-logo-F880E5131F-seeklogo.com.svg"},
    @{name="sap.svg"; url="https://seeklogo.com/files/S/sap-logo-9190E0013C-seeklogo.com.svg"},
    @{name="kotak.svg"; url="https://seeklogo.com/files/K/kotak-mahindra-bank-logo-B2C8096EC3-seeklogo.com.svg"},
    @{name="mms.svg"; url="https://seeklogo.com/files/M/m-ms-logo-FAB33C65B9-seeklogo.com.svg"},
    @{name="smc.svg"; url="https://seeklogo.com/files/S/smc-logo-7BBEE05283-seeklogo.com.svg"},
    @{name="lifestyle.svg"; url="https://seeklogo.com/files/L/lifestyle-logo-6530D4B31E-seeklogo.com.svg"},
    @{name="redbull.svg"; url="https://seeklogo.com/files/R/red-bull-logo-7B62D12C0D-seeklogo.com.svg"},
    @{name="microsoft.svg"; url="https://seeklogo.com/files/M/microsoft-logo-9D0E057BC5-seeklogo.com.svg"},
    @{name="cred.svg"; url="https://seeklogo.com/files/C/cred-logo-18EE0C60C5-seeklogo.com.svg"},
    @{name="ibm.svg"; url="https://seeklogo.com/files/I/ibm-logo-64456E531D-seeklogo.com.svg"},
    @{name="hp.svg"; url="https://seeklogo.com/files/H/hp-logo-9AEAB78C37-seeklogo.com.svg"},
    @{name="intel.svg"; url="https://seeklogo.com/files/I/intel-logo-0C6AABEFDD-seeklogo.com.svg"}
    # Some logos might not be available at these sources, you may need to find alternatives
)

# Download each logo
foreach ($logo in $logos) {
    $outputPath = Join-Path $logosDir $logo.name
    Download-File -url $logo.url -outputFile $outputPath
}

# Create placeholder SVGs for any missing logos
$logoFiles = @(
    "charlottesweb.svg",
    "coffeebean.svg", 
    "europaket.svg",
    "handlerbund.svg",
    "misbu.svg",
    "nicetec.svg"
)

$placeholderSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 100">
  <rect width="100%" height="100%" fill="#f8f8f8"/>
  <text x="50%" y="50%" font-family="Arial" font-size="12" text-anchor="middle" dominant-baseline="middle" fill="#666">LOGO</text>
</svg>
"@

foreach ($logoFile in $logoFiles) {
    $filePath = Join-Path $logosDir $logoFile
    if (-not (Test-Path $filePath)) {
        Write-Host "Creating placeholder for $logoFile..."
        $placeholderSvg | Out-File -FilePath $filePath
    }
}

Write-Host "Logo download completed. Please check the logos directory." -ForegroundColor Green
