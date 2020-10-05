require 'fileutils'
require 'pathname'
require 'find'

def is_root?(filename)
    %r{// ROOT} =~ IO.readlines(filename).first
end

def find_root_asciidocs_files
    Find.find('.').select do |filename|
        filename.end_with? '.asciidoc' and is_root? filename
    end
end

def compile_asciidoc
    puts "Compiling asciidocs..."
    roots = find_root_asciidocs_files
    `asciidoctor -R docs -D dist #{roots.join(' ')}`
end

def should_copy?(path)
    path.end_with? '.svg'
end

def copy_images
    Find.find('docs') do |entry|
        root = Pathname.new 'docs'
        dist = Pathname.new 'dist'

        if should_copy? entry
            path = Pathname.new entry
            relative_path = path.relative_path_from(root)
            from_path = root + relative_path
            to_path = dist + relative_path

            puts "Copying #{from_path} to #{to_path}"
            FileUtils.copy(from_path.to_s, to_path.to_s)
        end
    end
end

task :clean do
    FileUtils.rm_rf 'dist'
end

task :build do
    compile_asciidoc
    copy_images
end

task :upload do
    Dir.chdir 'dist' do
        `ssh -p 22345 -l upload leone.ucll.be rm -rf /home/frederic/courses/apt/volume/*`
        puts `scp -P 22345 -r * upload@leone.ucll.be:/home/frederic/courses/apt/volume`
    end
end