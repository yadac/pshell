# 2017/10/02
# 拡張子なしのファイルに拡張子jpgを付与
# 拡張子付与後に同名ファイルが存在する場合は付与しない動作

# TODO
# 引数で対象ディレクトリのパスを受けるようにする
# 拡張子付与後に同名ファイルが存在する場合は削除 or 上書きする
# 拡張子をoptionalな引数にする

# 対象ディレクトリ
cd "C:\Users\yosuke.adachi\OneDrive - Avanade\wallpaper"

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