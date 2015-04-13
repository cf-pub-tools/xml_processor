require 'tmpdir'

def around_in_xyleme_tmpdir(environment)
  around do |spec|
    begin
      old_env = environment.clone
      Dir.mktmpdir do |tmpdir|
        environment.update(
          'XML_OUTPUT_DIR' => File.join(tmpdir, 'output')
        )

        spec.run
      end
    ensure
      environment = old_env
    end
  end
end
