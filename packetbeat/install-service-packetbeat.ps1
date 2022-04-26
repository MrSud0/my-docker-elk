# Delete and stop the service if it already exists.
if (Get-Service packetbeat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='packetbeat'"
  $service.StopService()
  Start-Sleep -s 1
  $service.delete()
}

$workdir = Split-Path $MyInvocation.MyCommand.Path

# Create the new service.
New-Service -name packetbeat `
  -displayName Packetbeat `
  -binaryPathName "`"$workdir\packetbeat.exe`" --environment=windows_service -c `"$workdir\packetbeat.yml`" --path.home `"$workdir`" --path.data `"$env:PROGRAMDATA\packetbeat`" --path.logs `"$env:PROGRAMDATA\packetbeat\logs`" -E logging.files.redirect_stderr=true"

# Attempt to set the service to delayed start using sc config.
Try {
  Start-Process -FilePath sc.exe -ArgumentList 'config packetbeat start= delayed-auto'
}
Catch { Write-Host -f red "An error occured setting the service to delayed start." }
