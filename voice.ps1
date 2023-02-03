<#
.SYNOPSIS
	Performs a text-to-speech test
.DESCRIPTION
	This PowerShell script performs a text-to-speech (TTS) test.
.EXAMPLE
	PS> ./speak-test
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

function Speak { param([string]$Text)
	write-output "'$Text'"
	[void]$Voice.speak("$Text")
}

try {
	$Voice = New-Object -ComObject SAPI.SPVoice
	$DefaultVolume = $Voice.volume
	$DefaultRate = $Voice.rate
	Speak("Let's begin with the default speed rate of $DefaultRate at the default volume of $($DefaultVolume)%.")
	$Voice.rate = 0
  $Voice.volume = 100
	Speak("I am in your walls, you cannot escape me.")
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
