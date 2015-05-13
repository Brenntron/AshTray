require_relative '../test_helper'

describe Cigar do
  describe "#all" do
    describe "if there are no cigars in the database" do
      if "should return an empty array" do
        assert_equal [], Cigar.all
      end
    end
      describe "if there are cigars" do
        before do
          create_cigar("Mille Flour")
          create_cigar("
        end
      end
  end
end
