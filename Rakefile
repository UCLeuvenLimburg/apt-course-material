require 'fileutils'


task :clean do
    FileUtils.rm_rf 'dist'
end

task :build do
    `asciidoctor -R docs -D dist **/*.asciidoc`
end