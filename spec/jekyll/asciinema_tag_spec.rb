require 'spec_helper'

describe Jekyll::Asciinema do
  it 'has a version number' do
    expect(Jekyll::Asciinema::VERSION).not_to be nil
  end
end

describe Jekyll::Asciinema::AsciicastTag do
  let(:doc) { doc_with_content(content) }
  let(:content)  { "{% asciicast #{asciicast} %}" }
  let(:output) do
    doc.content = content
    doc.output  = Jekyll::Renderer.new(doc.site, doc).run
  end

  context "valid asciicast" do
    let(:asciicast) { 14 }

    it "produces the correct script tag" do
      expect(output.strip).to eq(%Q{<script type="text/javascript" src="https://asciinema.org/a/#{asciicast}.js" id="asciicast-#{asciicast}" async="async"></script>})
    end
  end
end

# https://asciinema.org/docs/embedding
