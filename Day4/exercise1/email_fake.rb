require "rspec"

class WordChecker
  def initialize subject_provider
    @subject_provider = subject_provider
  end

  def check words
    result = false
    subjects = @subject_provider.get_subjects
    subjects.find( |subject| if subject.match(words[0]) return result = true )
    result
  end
end