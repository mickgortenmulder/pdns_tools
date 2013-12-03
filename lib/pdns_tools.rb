# Dependencies
require 'mysql2'
require 'open-uri'
require 'json'
require 'yaml'

# Project's internal modules
require 'pdns_tools/version'
require 'pdns_tools/deprovision_zones'
require 'pdns_tools/install_recursor_forwards'
require 'pdns_tools/recursor_stats'
require 'pdns_tools/server_stats'