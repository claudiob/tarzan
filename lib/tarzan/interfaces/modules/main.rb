require_relative './tournament'


# require_relative './shell'
# Tournament.run Shell

# require_relative './campfire'
# Tournament.run Campfire, subdomain: ENV['CAMPFIRE_SUBDOMAIN'], room_id: ENV['CAMPFIRE_ROOM_ID'], token: ENV['CAMPFIRE_TOKEN']
#
require_relative './desktop'
Tournament.run Desktop