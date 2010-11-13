maintainer        "Sahil Cooner DOT com"
maintainer_email  "sahil.cooner@gmail.com"
description       "Sets up the machine with Sys Ops related tools"
version           "0.1"
%w{ ubuntu centos }.each do |os|
  supports os
end
