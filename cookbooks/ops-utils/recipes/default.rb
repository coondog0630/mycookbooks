#
#
# Author:: Sahil R Cooner (mailto:sahil.cooner@gmail.com)

case node[:platform]
when "debian", "ubuntu"
  # package "policykit"
  package "emacs22-nox"
  # require_recipe "apt"
else 
  package "emacs-nox"
end

# Install these tools that are helpful for sys ops
package "man-db"
package "vim"
package "git-core"
package "sysstat"
package "rsync"
package "bash-completion"
package "netcat"
package "lsof"
package "ack-grep"
package "gdb"
package "strace"
package "curl"
package "mailutils"
package "htop"
package "socat"
package "dstat"
package "zsh"
package "iptraf"
package "tcpdump"

# need to define first for things notifying
service "sysstat" do 
  supports :restart => true
  action :enable
end

# copy configuration files for these packages
remote_file "/etc/default/sysstat" do 
  source "default-sysstat"
  mode "0644"
  checksum "96f6ec76d9a4cc20f851d06bf1c665ef690aceac"
  # if the file changes on the remote machine let's reload sysstat service
  notifies :restart, resources(:service=> "sysstat")
end

