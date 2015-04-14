execute "Install fail2ban" do
  command "sudo apt-get install fail2ban -y"
end

execute "install ufw" do
   command "sudo apt-get install ufw -y"
end

execute "enable ufw" do
   command "sudo ufw enable"
end

execute "allow 22 port in ufw" do
  command "sudo ufw allow ssh"
end

execute "allow 80 port on ufw" do
   command "sudo ufw allow 80"
end

execute "create cron.deny.bak" do
   command "sudo touch /etc/cron.deny.bak"
   command "sudo chmod 777 /etc/cron.deny.bak"
end


execute "create cron.deny" do
   command "sudo touch /etc/cron.deny"
   command "sudo chmod 777 /etc/cron.deny"
end
execute "deny cronjob for all user except root" do
   command "cat /etc/passwd | cut -d ':' -f 1  >  /etc/cron.deny.bak | sed 's/root/x/g' /etc/cron.deny.bak >  /etc/cron.deny"  
end


execute "restart cron service" do
   command "sudo service cron restart"
end


#template "/etc/logrotate.d/apache2" do
 
template "#{node[:logfile_path]}" do
 source "apache2.rb"
 variables(:logfile_path => node[:logfile_path])
 variables(:logfile => node[:logfile])
#   action :create
end


