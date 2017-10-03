$homefolder = Join-Path $env:USERPROFILE "documents\powershell\scripts"

# 例外処理可能
try{
  
  # comオブジェクト生成 process = "Microsoft Excel"
  $xls = New-Object -ComObject Excel.Application
  # excel可視化
  $xls.Visible = $true

  # workbookを追加 
  $book = $xls.WorkBooks.Add()
  $book.Activate()

  # workbookに含まれるworksheetの数
  echo $book.WorkSheets.Count

  # シート名を出力
  $wc = $book.WorkSheets
  foreach($ws in $wc){
    $ws.Name
    $ws.Cells(1,1).Value = "Hello"
  }

  # 開く
  # $book = $xls.WorkBooks.Open("path")

  # 保存 path指定可能
  # cf) http://nky-tech.blogspot.jp/2010/06/excel-excelcom-reflection.html
  $xls.Save($homefolder)

}finally{

  $book.Close()
  $xls.Quit()
  # comオブジェクトの破棄
  [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($xls)

}