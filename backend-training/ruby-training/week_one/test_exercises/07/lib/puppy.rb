# frozen_string_literal: true

class Puppy
  # Creates an instance variable "state" that you can set in your class.
  # "_reader" means other objects can read your state by calling "some_puppy.state".
  attr_reader :state, :speak

  def initialize
    # Puppies are calm at first.
    @state = :calm
    @speak = 'Bark!'
  end

  def pet
    if @state == :calm
      @state = :wagging
    elsif @state == :wagging
      @state = :excited
    end
  end

  def rub_belly
    @state = :calm
  end

  def spray
    if @state == :calm
      @state = :growling
      @speak = 'Grrrr.'
    elsif @state == :growling
      @state = :angry
      @speak = 'BARK BARK BARK!'
    end
  end
end
