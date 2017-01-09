##
# 情報収集

# コピー先フォルダ
$copyto = Join-Path $env:USERPROFILE "pictures\gazo\blog-images"

# picturefolder
$picturefolder = Join-Path $env:USERPROFILE "pictures\gazo"

# 接頭辞
$filesuffix = "blog"

# 拡張子 誤植
$extension = "jpg"

# 検索拡張子
$filter = "*.${extension}"

# 日付フォーマット
$dateformat = "yyyy-MM-dd-HH-mm-ss"

##
# 操作

# 存在確認
$exists = Test-Path $copyto
if (-not ($exists)){
    mkdir $copyto
}

cd $picturefolder

echo "コピー元フォルダに移動しました：$((pwd).Path)"

# 中カッコは同じ行にないとダメ
ls $filter | ForEach-Object{
 $original = $_.Name
 $createtime = $_.CreationTime | Get-Date -Format $dateformat
 $copyfile = Join-Path $copyto "${filesuffix}${createtime}${extension}"
 echo "コピーしています：　コピー元 ${original} -> コピー先 ${copyto}"
 cp -Path $original -Destination $copyfile
}

echo "終了しました"