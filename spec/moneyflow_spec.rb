require_relative '../lib/moneyflow.rb'

describe Flow do
  it { is_expected.to respond_to(:deposit).with(1).argument }
  it { is_expected.to respond_to(:withdraw).with(1).argument }

  describe ".balance" do
    it "passes over balance state" do
      expect(subject.balance).to eq 0
    end
  end
  describe ".history" do
    it "passes over array of history of transactions" do
      subject.deposit(60)
      expect(subject.history).to eq [{ date: Time.new.strftime("%d/%m/%Y"),
                    action: "credit", amount: '%.2f' % 60, balance: 60 }]
    end
  end
  describe "#deposit" do
    it "correctly updates balance" do
      expect { subject.deposit(45.63) }.to change {subject.balance}.by(45.63)
    end
  end
  describe "#withdraw" do
    it "correctly updates balance" do
      subject.deposit(45.63)
      subject.withdraw(16.20)
      expect(subject.balance).to eq (45.63 - 16.20)
    end
  end
end
