require_relative '../test_helper'

describe Cigar do
  describe "#all" do
    describe "if there are no cigars in the database" do
      it "should return an empty array" do
        assert_equal [], Cigar.all
      end
    end
  end
end
