require_relative 'reservation'

module Hotel
  class Date_Range  
    attr_accessor :check_in, :check_out

    def initialize(check_in, check_out)
      @check_in = check_in
      @check_out = check_out 

      if check_out != nil
        if @check_out <= @check_in 
          raise ArgumentError, "Invalid date range!"
        end 
      end 
    end 

    def date_overlap(reservation)
      return true
    end

    def include?(date)
    end 

    def nights
      total_nights = check_out - check_in 
      return total_nights
    end 
    #[code bloc]

  end 
end 