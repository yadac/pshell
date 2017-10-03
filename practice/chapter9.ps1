# execution policy
# RemoteSinged = インターネットからdlされたものはデジタル署名されている場合に実行可能、ローカルのものは実行可能

# policyの確認と設定
# Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

$homefolder = Join-Path $env:USERPROFILE "documents\powershell\scripts"
# cd $homefolder

# 自作scriptにパラメータ渡す
.\SayHello.ps1 -someone natsuki
.\SayHello.ps1

