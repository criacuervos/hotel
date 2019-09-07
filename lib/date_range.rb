require_relative 'reservation'
require_relative 'reservation_maker'

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
    
    def date_overlap?(other) 
      return (check_in...check_out).cover?(other.check_in) || 
      (check_in...check_out).cover?(other.check_out) || 
      (other.check_in...other.check_out).cover?(check_in) || 
      (other.check_in...other.check_out) == (check_in...check_out)
      #refactor to get some variable names goin to check against 
    end
    
    def include?(date)
      if date >= @check_in && date < @check_out 
        return true 
      else 
        return false
      end 
    end 
    
    def nights
      total_nights = check_out - check_in 
      return total_nights
    end 
  end 
end 