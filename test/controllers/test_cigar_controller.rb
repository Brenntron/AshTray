require_relative "../test_helper"

describe CigarsController do

  describe ".index" do
    let(:controller) {CigarsController.new}

    it "should say no cigars found when empty" do
      actual_output   = controller.index
      expected_output = "No cigars found. Add a cigar.\n"
      assert_equal expected_output, actual_output
    end
  end

  describe ".add" do
    let(:controller) {CigarsController.new}

    it "should add a cigar" do
      controller.add("Mille Fleurs")
      assert_equal 1, Cigar.count
    end

    it "should not add cigar all spaces" do
      cigar_name = "      "
      assert_raises(ArgumentError) { controller.add(cigar_name) }
    end
  end
end