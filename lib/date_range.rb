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
      #This is not working in cases where other's checkout date is the same as @dates check in date
      #I could explicitly state that if any check_out is EQUAL to any check in, then it is not an overlap
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