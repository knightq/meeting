class Cart
  attr_reader :meetings

  def initialize
    @meetings = Set.new
  end

  def add_meeting(meeting)
    @meetings << meeting unless @meetings.include?(meeting)
  end

end

