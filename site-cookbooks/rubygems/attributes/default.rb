
# Set the path to the gem binary
set_unless[:gem][:binary] = "/opt/ruby-enterprise/bin/gem"

# Set the list of packages to install on the system that are needed for native gem builds
set_unless[:gem][:pkglibs] = Array.new

# This is a Mash of "gem" => "version", for the gems you want to install and their appropriate versions
set_unless[:gem][:list] = Mash.new