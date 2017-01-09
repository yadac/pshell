# 波カッコを付与することでscript blockになる
# script blockの実行は、&をつける、invoke()で呼び出す　方法がある
# script blockは変数に代入できる　変数の実行方法は上記2通り
# $hello = {Write-Host "hello"}

# 慣例 : 動詞 + 目的語
function Get-Hello($someone){
  if ($someone -eq "natsuki"){
    Write-Host "hi, $someone"
  }else{
    Write-Host "hello, $someone"
  }
}

Get-Hello("natsuki")
Get-Hello("todo")




