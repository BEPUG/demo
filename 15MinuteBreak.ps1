# Simple break timer script for BEPUG meetup sessions
# @bepowershell
# https://bepug.dev
#123

$BreakLength = 15 * 60 #seconds

$ProgressParams = @{
    Activity = 'BEPUG meetup 11 March'
    Status = '15 minute break'
}

1..$breaklength |
    ForEach-Object {
        Write-Progress @ProgressParams -SecondsRemaining ($breaklength - $PSItem) -PercentComplete (($PSItem / $breaklength) * 100)
        Start-Sleep -Seconds 1
    }

$ErrorActionPreference = 'Ignore'
$WAVGong = "$PSScriptRoot\chinese-gong-daniel_simon.wav" #http://soundbible.com/grab.php?id=2148&type=wav
$Gong = New-Object System.Media.SoundPlayer
$Gong.SoundLocation = $WAVGong
$Gong.Play()
