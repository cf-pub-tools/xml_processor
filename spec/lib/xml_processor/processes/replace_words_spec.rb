require_relative '../../../../lib/xml_processor/processes/replace_words_in_text'

module XmlProcessor
  module Processes
    describe "replacing words" do
      it "replaces a single word in all of the content" do
        input = {
          "directory/streetslangz" => "HortonWorkz rulez 4realz",
          "somefilename" => "somecontent"
        }
        output = ReplaceWordsInText.new("HortonWorkz" => "Pivotal Software").
          call(input)

        expect(output["directory/streetslangz"]).to eq("Pivotal Software rulez 4realz")
        expect(output["somefilename"]).to eq("somecontent")
      end
    end
  end
end
