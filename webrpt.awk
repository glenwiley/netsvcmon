# webrpt.awk
# Glen Wiley <glen.wiley@gmail.com>
#
# generate web page that shows the status of the services checked
# TODO: link to cgi to generate host/service specific reports from history

BEGIN {
	print "<!DOCTYPE html><html lang=\"en\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /><meta charset=\"utf-8\" />";
	print "<title>Services Monitoring Report: gwiley.com</title>";
	print "<head>Services Monitoring Report: gwiley.com</head>";
	print "<body>";
	print "<table border=1>";
	print "<tr><th>Host</th><th>Service</th><th>Test 1</th><th>Test 2</th><th>Time</th></tr>";
}

{
	dt=$1;
	host=$2
	svc=$3;

	print "<tr>";
	print "<td>" host "</td>"
	print "<td>" svc "</td>"
	for(i=4; i<=NF; i++)
	{
		if(index($i, "FAIL") == 0)
		{
			cellcolor="white";
		}
		else
		{
			cellcolor="red";
		}
		print "<td bgcolor=\"" cellcolor "\">" $i "</td>";
	}
	for(;i<6;i++)
	{
		print "<td></td>";
	}
	print "<td>" dt "</td>";
	print "</tr>";
}

END {
	echo "</table>";
	print "</body>";
	print "</html>";
}
