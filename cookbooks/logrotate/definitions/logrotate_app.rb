define :logrotate_app, :enable => true do
  include_recipe "logrotate"

  if params[:enable]
    template "/etc/logrotate.d/#{params[:name]}" do 
      source "logrotate.erb"
      cookbook "logrotate"
      mode 0440
      owner "root"
      group "root"
      backup false
      variables(
                :paths  => params[:paths],
                :rotate => params[:rotate]
                )
    end
  else
    execute "rm /etc/logrotate.d/#{params[:name]}" do 
      only_if FileTest.exists?("/etc/logrotate.d/#{params[:name]}")
      command "rm /etc/logrotate.d/#{params[:name]}"
    end
  end
end
