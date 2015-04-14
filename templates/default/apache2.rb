<%= @logfile %>/*.log {
	daily
        size 100M
	rotate 10
	compress
	notifempty
	create 640 root adm
}

