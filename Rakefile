require 'fileutils'
require 'find'

def is_root?(filename)
    %r{// ROOT} =~ IO.readlines(filename).first
end

def find_root_asciidocs_files
    Find.find('.').select do |filename|
        filename.end_with? '.asciidoc' and is_root? filename
    end
end

task :clean do
    FileUtils.rm_rf 'dist'
end

task :build do
    roots = find_root_asciidocs_files
    `asciidoctor -R docs -D dist #{roots.join(' ')}`
end

task :upload do
    Dir.chdir 'dist' do
        puts `ssh -p 22345 -l upload leone.ucll.be rm -rf /home/frederic/courses/apt/volume/*`
        `scp -P 22345 -r * upload@leone.ucll.be:/home/frederic/courses/apt/volume`
    end
end