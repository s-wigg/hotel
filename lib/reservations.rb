require 'date'
require_relative 'hotel.rb'
require_relative 'room.rb'


module Hotel_System

  class Reservations
    attr_accessor :all_rooms, :check_in, :check_out, :room, :today, :num_of_nights, :all_reservations, :total_cost, :date_range

    def initialize(room, check_in, check_out)
      @room = room
      @check_in = Date.parse(check_in)
      @check_out = Date.parse(check_out)
      @today = Date.today
      if self.valid_date_range?
      end

    end

    def valid_date_range?
      if check_in < today
        raise ArgumentError.new("Invalid check in date")
      elsif check_out < today
        raise ArgumentError.new("Invalid check out date")
      elsif check_out < check_in
        raise ArgumentError.new("Invalid date range")
      elsif check_in == check_out
        raise ArgumentError.new("Check out must be after check in")
      else
        return true
      end
    end

    def num_of_nights
      @num_of_nights = (@check_out - @check_in).to_i
    end

    def res_date_range_generator
      @date_range = [@check_in]
      date = @check_in
      until date.next == @check_out
        date = date.next
        @date_range << date
      end
      return @date_range
    end

    def total_cost
      total_cost = num_of_nights * @room.price
    end
  end

end
