# goatops-powershell-cli

# Powershell script picking wisdoms from GoatOps

# https://github.com/binford2k/goatops

param(
    [switch] $Run
);

function Get-Wisdom {
    try {
        $sourceURL = "https://raw.githubusercontent.com/binford2k/goatops/master/index.html";
        $data = [string] (Invoke-WebRequest -Uri $sourceURL -UseBasicParsing -ErrorAction SilentlyContinue).RawContent;
        $dataArray = $data.Split("`n");
        $wisdomArray = @();

        foreach ($line in $dataArray) {
            if (-not [string]::IsNullOrWhiteSpace($line)) {
                $cleanLine = $line.Trim();
                if ($cleanLine.StartsWith("<li>")) { 
                    $cleanLine = $cleanLine.Replace("<li>", "").Replace("</li>", "");
                    $wisdomArray += $cleanLine;
                };
            };
        };
        return ($wisdomArray | Get-Random);
    }
    catch {
        return "Meh!";
    };    
};

function Get-GoatWisdom {
    $wisdom = (Get-Wisdom);
    $goatMessage = "";
    $goatMessage += "    ";
    $goatMessage += $("-" * ($wisdom.length + 6));
    $goatMessage += "`n    <[ ${wisdom} ]>`n";
    $goatMessage += "    ";
    $goatMessage += $("-" * ($wisdom.length + 6));
    $goatMessage += "`n            \`n";
    $goatMessage += "             \`n";
    $goatMessage += "              )__(`n";
    $goatMessage += "             '|oo|'________/`n";
    $goatMessage += "              |__|         |`n";
    $goatMessage += "               V ||`"`"`"`"`"`"`"||`n";
    $goatMessage += "                 ||       ||`n";
    return $goatMessage;

};

if ($Run.IsPresent) { Get-GoatWisdom; };