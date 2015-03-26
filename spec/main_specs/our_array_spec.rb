require 'our_array'

RSpec.describe OurArray do
  let(:kernel_array) { (1..10).to_a }
  let(:our_array) { described_class.new (1..10).to_a }

  describe "it's inheritance" do
    it 'does not mix in Enumerable' do
      expect(described_class.ancestors).not_to include(Enumerable)
    end
    it 'is not a subclass of Array' do
      expect(described_class.ancestors).not_to include(Array)
    end
  end

  describe '.new' do
    context 'with a size' do
      it 'creates an array of that size, with a default value of nil' do
        expect(described_class.new(10).array).to eq(Array.new(10))
      end
    end
    context 'with a size and a default argument' do
      it 'creates an array of that size, with any given default value' do
        expect(described_class.new(10, "Yo!").array).
          to eq(Array.new(10, "Yo!"))
      end
    end
    context 'with a size and a block' do
      it 'creates an array of that size, with values taken from the block' do
        expect(described_class.new(10) {|x| 2**x}.array).
          to eq(Array.new(10) {|x| 2**x})
      end
    end
  end

  describe '#each' do
    it 'behaves like Array#each' do
      kernel_result = []
      our_result    = []
      kernel_array.each{|x| kernel_result << 2**x}
      our_array.   each{|x| our_result    << 2**x}
      expect(kernel_result).to eq(our_result)
    end
    it 'does not mutate the array' do
      expect(our_array.each{|x| 2**x}).to eq(kernel_array)
    end
  end

  describe '#map' do
    it 'behaves like Array#map' do
      kernel_result = kernel_array.map{|x| 2**x}
      our_result    = our_array.   map{|x| 2**x}
      expect(kernel_result).to eq(our_result)
    end
  end

  describe '#reduce' do
    context 'with only a block' do
      it "behaves like Array#reduce" do
        kernel_result = kernel_array.reduce{|memo, x| memo + x}
        our_result    = our_array.   reduce{|memo, x| memo + x}
        expect(kernel_result).to eq(our_result)
      end
    end
    context 'with a block and a initial value' do
      it "behaves like Array#reduce" do
        kernel_result = kernel_array.reduce(1){|memo, x| memo + x}
        our_result    = our_array.   reduce(1){|memo, x| memo + x}
        expect(kernel_result).to eq(our_result)
      end
    end
  end

  describe '#select' do
    it 'behaves like Array#select' do
      kernel_result = kernel_array.select{|x| x.even?}
      our_result    = our_array.   select{|x| x.even?}
      expect(kernel_result).to eq(our_result)
    end
  end

end
