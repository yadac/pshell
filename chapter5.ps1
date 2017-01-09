$homefolder = Join-Path $env:USERPROFILE "documents\powershell\scripts"

cd $homefolder

$datafile = Join-Path $homefolder "sales.csv"

# here documentによるファイル生成用
$data = @"
name, location, sales
edo, tokyo, 200000
owari, aichi, 340000
naniwa, oosaka, 180000
chikuho, fukuoka, 150000
"@

# ファイルが存在しなければ終了したい場合はreturnとする(exitではない)
if (-not (Test-Path $datafile)){
 echo "data file can not find! create data file."
 # redirect + heredocument
 $data > $datafile
 # return
}

# csv読み込み encode指定できる
$csv = Import-Csv -Encoding Default $datafile

# csvがunicodeの場合
# cp $datafile -Destination "${datafile}.bak"
# $csv = cat -Encoding UTF8 $datafile | ConvertTo-Csv | Export-Csv $datafile 

# csvにheader情報がない場合 headerがある場合はheaderが二重になるため集計でエラー発生する
# $csv = Import-Csv -Encoding Default -Header name, location, sales $datafile


# 集計処理
$csv | Measure-Object -Property sales -Sum -Average -Maximum 

# 出力 type = 情報出力しない encode = shift-jis(windows default) encodeなしはunicode
$resultfile = Join-Path $homefolder "result.csv"
$csv | Export-Csv -NoTypeInformation -Encoding Default -Path $resultfile

# html出力
$resultfile_html = Join-Path $homefolder "result.html"
$csv | ConvertTo-Html > $resultfile_html

# xml出力
$resultfile_xml = Join-Path $homefolder "result.xml"
$csv | ConvertTo-Xml | Export-Clixml $resultfile_xml

# json出力 (JavaScript-Object-Notation)
$resultfile_json = Join-Path $homefolder "result.json"
$csv | ConvertTo-Json > $resultfile_json
