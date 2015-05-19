require_relative '../test_helper'

describe Cigar do
  describe "#all" do
    describe "if there are no cigars in the database" do
      it "should return an empty array" do
        assert_equal [], Cigar.all
      end
    end
      describe "if there are cigars" do
        before do
          cigar.new("Mille Fleurs", "5\"", 42).save
          cigar.new("1508 Ruby", "6\"", 50).save
        end
        it "should return the cigars in ASC order" do
          cigars = Cigars.all
          assert_equal ["1508 Ruby", "Mille Fleurs"], cigars.map{ |cigar| cigar.name }
        end
      end
  end
end
