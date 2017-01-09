# 岡山県岡山地域
$cityid = "330010"

# web-service
$url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=$cityid"

$json = (Invoke-WebRequest $url).Content
$js = ConvertFrom-Json $json
# $js.location
$js.description.text