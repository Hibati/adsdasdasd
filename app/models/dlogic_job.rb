class DlogicJob < Struct.new(:name)
  # Custom DelayedJobs much implement the perform method
  def perform
    # Expensive system call (creates a shell and execute a command)
    text = %x(/usr/games/fortune)
    Message.create!(text: text)
  end
end