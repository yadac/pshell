
# spotlightの画像を保存する
# 対象フォルダのファイルに拡張子jpgを付与してファイルを識別する
# あとは壁紙にでも...

# 使い方
# 1, 400kb以上のファイルを対象フォルダにコピーします(#spotlightに表示されるファイルである確率が高い)
# 2, scriptを実行します

# spotlightのきれいな画像はここにあります
# C:\Users\doruj\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets

# 対象フォルダ
cd "C:\Users\doruj\Dropbox\personal\wallpapers"

# ファイルを取得, ディレクトリは対象外
$files = Get-ChildItem * | Where-Object { ! $_.PSIsContainer }

# 拡張子なしファイルに拡張子を付与
foreach($file in $files){

    $ext = [System.IO.Path]::GetExtension($file)

    if ($ext.Length -eq 0){
        echo $file
        Rename-Item $file.Name -NewName ($file.Name + ".jpg")
    }

}

# 対象ディレクトリ一覧表示して確認
Get-ChildItem * | Where-Object { ! $_.PSIsContainer } | ForEach-Object { echo $_.Name }

pause