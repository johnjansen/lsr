module Lsr
  class User
    # dscacheutil -q user
    # TODO, make a list of all users and query that instead of shelling out each time
    # IDEA, cache up the users by id for some length of time and then flush them
    # IDEA, flush might be possible by allowing data to fall out of scope after some timeout
    def self.from(uid : UInt32)
      `id -nu #{uid}`
    end
  end

  class Group
    def self.from(gid : UInt32)
      # `id -ng #{gid}`
      "staff"
    end
  end
end
