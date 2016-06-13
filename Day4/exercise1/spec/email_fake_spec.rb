require_relative "../email_fake.rb"

describe WordChecker do
  describe "Email provider has no strings" do
    it "should return true if no words given" do
      # Nos crea una clase con un metodo
      provider = instance_double('EmailProviderFake', :get_subjects => [] )
      counter = WordChecker.new(provider)
      expect(counter.check([])).to eq(true)
    end

    it "should return true if one word given" do
      provider = instance_double('EmailProviderFake', :get_subjects => [] )
      counter = WordChecker.new(provider)
      expect(counter.check(['subject'])).to eq(false)
    end
  end

  describe "Email provider has strigns" do
    it "should return true when a word is included in a subject" do
      provider = instance_double('EmailProviderFake', :get_subjects => ["subject"] )
      counter = WordChecker.new(provider)
      expect(counter.check(["subject"])).to eq(true)
    end

   it "should return false when a word is included in a subject and word given is different " do
      provider = instance_double('EmailProviderFake', :get_subjects => ["subject hello"] )
      counter = WordChecker.new(provider)
      expect(counter.check(["hello"])).to eq(true)
    end

    xit "should return false when a two words are included in a subject and word given is different " do
      provider = instance_double('EmailProviderFake', :get_subjects => ["subject", "test"] )
      counter = WordChecker.new(provider)
      expect(counter.check(["hello",])).to eq(false)
    end

  end
end