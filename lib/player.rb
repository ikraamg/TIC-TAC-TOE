class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def talk_with(recipient)
    dialog = []
    dialog << introduce_self[0]
    dialog << recipient.introduce_self[1]
    dialog << initiator_speech[0]
    dialog << recipient.initiator_speech[1]
    dialog << ask_for_play(recipient)[0]
    dialog << recipient.ask_for_play(self)[1]
  end

  protected

  def introduce_self
    ["Hello, I am #{@name}", "Hi! I am #{name} nice to meet you!"]
  end

  def initiator_speech
    ['Oh yesterday the weather was awesome!', 'Omg yes! That was great!']
  end

  def ask_for_play(recipient)
    ["Do you know about this game called TicTacToe #{recipient.name}?", "Oh yes I've heard about it let's play!!!"]
  end
end