require_relative '../lib/statement.rb'

describe Statement do
  let(:name_of_class_double)  { double :name_of_class }
  subject { described_class.new( name_of_class_double) }
  before(:each) do
    array = []
    allow(name_of_class_double).to receive(:new).and_return(array)
  end
  it { is_expected.to respond_to(:print_out) }
  describe "print_out" do
    it "by default it only prints out a header" do
      allow(subject).to receive(:working_array).and_return([])
      expect {subject.print_out}.to output("date || credit || debit || balance\n").to_stdout
    end
    it "prints out a header and actions history" do
      allow(subject).to receive(:working_array).and_return([{ date: Time.new.strftime("%d/%m/%Y"),
                    credit: '%.2f' % 60, balance: '%.2f' % 60 }])
      expect {subject.print_out}.to output("date || credit || debit || balance\n26/10/2020 || 60.00 ||  || 60.00\n").to_stdout
    end
  end
end
