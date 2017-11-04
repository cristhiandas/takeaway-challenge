require 'dishes'
describe Dishes do

  let(:printed_menu) {described_class.new.print_menu}
  context 'When asking for an list' do
    it 'have a list of dishes' do
      subject.print_menu
      expect(subject.menu).to be_a Array
    end

    it 'returns the list of dishes' do
      subject.print_menu
      expect(subject.menu[0]).to eq ({:Pancake=>1})
      expect(subject.menu[1]).to eq ({:Chocolate_pancake=>1.5})
      expect(subject.menu[-1]).to eq ({:Banana_shake=>3.2})
    end

    it 'Prints the list in the ouput' do
      expect { printed_menu }.to output.to_stdout
    end
  end

  context 'when selecting a dish' do
    it 'returns the specified dish' do
      expect(subject.selecting_dish('pancake')).to eq ({:Pancake=>1.0})
    end
    it 'returns the specified dish' do
      expect(subject.selecting_dish('Waffles')).to eq ({:Waffles=>1.0})
    end
    it 'Raise an error if the dish is not on the list' do
      expect { subject.selecting_dish('nothing') }.to raise_error(RuntimeError)
    end
  end
end
