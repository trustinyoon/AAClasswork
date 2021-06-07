require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each { |room_name, room_cap| @rooms[room_name] = Room.new(room_cap) }
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        rooms.keys.include?(name) ? true : false
    end

    def check_in(person, room)
        if room_exists?(room)
            if rooms[room].full?
                p "sorry, room is full"
            else
                rooms[room].add_occupant(person)
                p "check in successful"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        rooms.any? { |name, instance| !instance.full?}
    end

    def list_rooms
        rooms.each { |name, instance| puts name + " #{instance.available_space}"}
    end
end
