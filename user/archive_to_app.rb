require 'xdg'
require 'down'
require 'fileutils'

class ArchiveToAppConfiguration
    attr_accessor :short_name, :name

    def initialize
        @downloads = {}
    end

    def add_download(platform, url, archive_format, strip_dirs=nil)
        @downloads[platform.to_sym] = {url: url, archive_format: archive_format, strip_dirs: strip_dirs}
    end

    def platform?(name)
        @downloads.key? name.to_sym
    end

    def destination()
        XDG['DATA_HOME'].to_path.join(short_name)
    end

    def destination?()
        destination.exist?
    end

    def download_for(os)
        @downloads[os]
    end
end

def archive_to_app()
    config = ArchiveToAppConfiguration.new

    yield config

    return unless config.platform?($current_os) && !config.destination?
    download = config.download_for($current_os)

    download_file = Down.download(download[:url], max_redirects: 5)

    begin
        Dir.mkdir(config.destination)

        # TODO: non tar based, gtar
        cmd = "tar -xf #{download_file.to_path} --directory='#{config.destination}'"
        cmd += " --strip-components=#{download[:strip_dirs]}" if download[:strip_dirs]

        raise IOError unless exec(cmd)
    rescue
        FileUtils.remove_dir(config.destination)
    end

    download_file.delete
end
