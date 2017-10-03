# dllフォルダ
$dllpath = Join-Path $env:USERPROFILE "libs"

# dll load
[void][System.Reflection.Assembly]::LoadFile("${dllpath}\System.Data.SQLite.dll")

# test.db
$homefolder = Join-Path $env:USERPROFILE "documents\powershell\scripts"
cd $homefolder

try{
  # connection open
  $con = New-Object System.Data.SQLite.SQLiteConnection
  # データベースのパスに誤りがある場合、空のデータベースが作成される、テーブルは存在しないので後続のexecuteでno such table が発生する
  $con.ConnectionString = "Data Source = $(Join-Path ${homefolder} "power.db")"
  $con.Open()

  # command
  $sql = "select id, name from employee"
  # テーブル一覧の確認
  # $sql = "select name from sqlite_master where type = 'table'"
  $cmd = New-Object System.Data.SQLite.SQLiteCommand
  $cmd.Connection = $con
  $cmd.CommandText = $sql
  
  # execute
  $rec = $cmd.ExecuteReader()
  while($rec.Read()){
    Write-Host("id : {0} name : {1}" -f $rec[0], $rec[1])
  }
}finally{
  $con.Close()
  $con.Dispose()
}

# ddl and dml
# > sqlite3.exe power.db
# sqlite> create table employee(id integer primary key autoincrement, name text not null);
# sqlite> insert into employee (name) values ('natsuki');
# sqlite> insert into employee (name) values ('todo');
# sqlite> insert into employee (name) values ('hidaka');
# sqlite> insert into employee (name) values ('udo');
