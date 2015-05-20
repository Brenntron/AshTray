require_relative "../test_helper"

describe CigarEntriesController do

  describe ".add" do
    let(:controller) {CigarEntriesController.new}

    it "should add an entry" do
      controller.add("1", 6)
      assert_equal 1, Cigar.count
    end
  end
end
