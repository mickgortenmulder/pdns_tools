module PdnsTools
  class RecursorStats
    def self.execute
      %x[/usr/bin/rec_control get questions cache-hits cache-misses concurrent-queries resource-limits unauthorized-tcp unauthorized-udp >/tmp/powerdns_recursor.stats]
      %x[chmod 644 /tmp/powerdns_recursor.stats]
    end
  end
end