irm https://aka.ms/win32-x64-user-stable -OutFile VSCodeUserSetup.exe ;
irm https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.9.1/npp.7.9.1.Installer.x64.exe -OutFile npp.7.9.1.Installer.x64.exe ;
irm https://cfhcable.dl.sourceforge.net/project/winscp/WinSCP/5.17.8/WinSCP-5.17.8-Setup.exe -OutFile WinSCP-5.17.8-Setup.exe ;
irm https://download.royalapps.com/RoyalTS/RoyalTSInstaller_5.03.61110.0.msi -OutFile royalts.msi ;

iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet" ;

Start-Process -Wait -FilePath "npp.7.9.1.Installer.x64.exe" -ArgumentList "/S" -PassThru ; 
Start-Process -Wait -FilePath "VSCodeUserSetup.x64.exe" -ArgumentList "/S" -PassThru ;
Start-Process -Wait -FilePath "VSCodeUserSetup.x64.exe" -ArgumentList "/S" -PassThru ;
Start-Process -Wait -FilePath "WinSCP-5.17.8-Setup.exe" ;
Start-Process -Wait -FilePath "royalts.msi" ;
