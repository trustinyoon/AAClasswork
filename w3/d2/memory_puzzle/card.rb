class Card
  def initialize
    @face_value = Array("A".."Z").sample
    @face_up = false
  end

  def display
    return @face_value if @face_up
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_value.to_s
  end

  def ==(arg)
    @face_value == arg
  end

end