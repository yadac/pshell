# 2017/10/04
# 対象ディレクトリ内の任意のファイル情報を出力する
# treeで十分、わかります

# 対象ディレクトリ
$Target = "C:\Temp\test"
$Size = 0

Set-Location $Target
foreach($Item in Get-ChildItem -Include *.jpg -Recurse){
    $Size += $Item.Length
}

# ファイルを取得, ディレクトリは対象外
Get-ChildItem -Include *.jpg -Recurse | Out-File -FilePath ($target + "\filelist.txt")

Write-Output ([string]$Size + " Bytes") | Add-Content ($target + "\filelist.txt") -Encoding Default
$Size = $Size / 1MB
echo ([string]$Size + " MB") | Add-Content ($target + "\filelist.txt") -Encoding Default

pause