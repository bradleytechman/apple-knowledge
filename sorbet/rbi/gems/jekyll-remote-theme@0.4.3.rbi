# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `jekyll-remote-theme` gem.
# Please instead update this file by running `bin/tapioca gem jekyll-remote-theme`.

# Public: Methods that generate a URL for a resource such as a Post or a Page.
#
# Examples
#
#   URL.new({
#     :template => /:categories/:title.html",
#     :placeholders => {:categories => "ruby", :title => "something"}
#   }).to_s
#
# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:12
module Jekyll
  class << self
    # Public: Generate a Jekyll configuration Hash by merging the default
    # options with anything in _config.yml, and adding the given options on top.
    #
    # override - A Hash of config directives that override any options in both
    #            the defaults and the config file.
    #            See Jekyll::Configuration::DEFAULTS for a
    #            list of option names and their defaults.
    #
    # Returns the final configuration Hash.
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:114
    def configuration(override = T.unsafe(nil)); end

    # Public: Tells you which Jekyll environment you are building in so you can skip tasks
    # if you need to.  This is useful when doing expensive compression tasks on css and
    # images and allows you to skip that when working in development.
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:101
    def env; end

    # Public: Fetch the logger instance for this Jekyll process.
    #
    # Returns the LogAdapter instance.
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:145
    def logger; end

    # Public: Set the log writer.
    #         New log writer must respond to the same methods
    #         as Ruby's interal Logger.
    #
    # writer - the new Logger-compatible log transport
    #
    # Returns the new logger.
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:156
    def logger=(writer); end

    # Public: Ensures the questionable path is prefixed with the base directory
    #         and prepends the questionable path with the base directory if false.
    #
    # base_directory - the directory with which to prefix the questionable path
    # questionable_path - the path we're unsure about, and want prefixed
    #
    # Returns the sanitized path.
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:174
    def sanitized_path(base_directory, questionable_path); end

    # Public: Set the TZ environment variable to use the timezone specified
    #
    # timezone - the IANA Time Zone
    #
    # Returns nothing
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:133
    def set_timezone(timezone); end

    # Public: An array of sites
    #
    # Returns the Jekyll sites created.
    #
    # source://jekyll-4.2.2/lib/jekyll.rb:163
    def sites; end
  end
end

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:13
module Jekyll::RemoteTheme
  class << self
    # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:26
    def init(site); end
  end
end

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:22
Jekyll::RemoteTheme::CONFIG_KEY = T.let(T.unsafe(nil), String)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:14
class Jekyll::RemoteTheme::DownloadError < ::StandardError; end

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:5
class Jekyll::RemoteTheme::Downloader
  # @return [Downloader] a new instance of Downloader
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:14
  def initialize(theme); end

  # @return [Boolean]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:28
  def downloaded?; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:18
  def run; end

  private

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:40
  def download; end

  # @raise [DownloadError]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:70
  def enforce_max_file_size(size); end

  # Codeload generated zip files contain a top level folder in the form of
  # THEME_NAME-GIT_REF/. While requests for Git repos are case insensitive,
  # the zip subfolder will respect the case in the repository's name, thus
  # making it impossible to predict the true path to the theme. In case we're
  # on a case-sensitive file system, strip the parent folder from all paths.
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:112
  def path_without_name_and_ref(path); end

  # @raise [DownloadError]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:64
  def raise_unless_sucess(response); end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:56
  def request; end

  # Returns the value of attribute theme.
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:34
  def theme; end

  # @return [Boolean]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:103
  def theme_dir_empty?; end

  # @return [Boolean]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:99
  def theme_dir_exists?; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:76
  def unzip; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:36
  def zip_file; end

  # Full URL to codeload zip download endpoint for the given theme
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:91
  def zip_url; end
end

# Size in bytes (1 GB)
#
# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:8
Jekyll::RemoteTheme::Downloader::MAX_FILE_SIZE = T.let(T.unsafe(nil), Integer)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:9
Jekyll::RemoteTheme::Downloader::NET_HTTP_ERRORS = T.let(T.unsafe(nil), Array)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:6
Jekyll::RemoteTheme::Downloader::PROJECT_URL = T.let(T.unsafe(nil), String)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/downloader.rb:7
Jekyll::RemoteTheme::Downloader::USER_AGENT = T.let(T.unsafe(nil), String)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:23
Jekyll::RemoteTheme::LOG_KEY = T.let(T.unsafe(nil), String)

# Jekyll::Theme expects the theme's gemspec to tell it things like
# the path to the theme and runtime dependencies. MockGemspec serves as a
# stand in, since remote themes don't need Gemspecs
#
# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:8
class Jekyll::RemoteTheme::MockGemspec
  extend ::Forwardable

  # @return [MockGemspec] a new instance of MockGemspec
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:15
  def initialize(theme); end

  # source://RUBY_ROOT/forwardable.rb:229
  def full_gem_path(*args, **_arg1, &block); end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:19
  def runtime_dependencies; end

  private

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:27
  def contents; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:41
  def dependency_names; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:31
  def path; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:35
  def potential_paths; end

  # Returns the value of attribute theme.
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:49
  def theme; end
end

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:12
Jekyll::RemoteTheme::MockGemspec::DEPENDENCY_PREFIX = T.let(T.unsafe(nil), Regexp)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/mock_gemspec.rb:13
Jekyll::RemoteTheme::MockGemspec::DEPENDENCY_REGEX = T.let(T.unsafe(nil), Regexp)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:5
class Jekyll::RemoteTheme::Munger
  extend ::Forwardable

  # @return [Munger] a new instance of Munger
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:10
  def initialize(site); end

  # source://RUBY_ROOT/forwardable.rb:229
  def config(*args, **_arg1, &block); end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:14
  def munge!; end

  # Returns the value of attribute site.
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:8
  def site; end

  private

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:50
  def configure_theme; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:46
  def downloader; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:60
  def enqueue_theme_cleanup; end

  # @return [Boolean]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:34
  def munged?; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:42
  def raw_theme; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/munger.rb:38
  def theme; end
end

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme.rb:24
Jekyll::RemoteTheme::TEMP_PREFIX = T.let(T.unsafe(nil), String)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:5
class Jekyll::RemoteTheme::Theme < ::Jekyll::Theme
  # Initializes a new Jekyll::RemoteTheme::Theme
  #
  # raw_theme can be in the form of:
  #
  # 1. owner/theme-name - a GitHub owner + theme-name string
  # 2. owner/theme-name@git_ref - a GitHub owner + theme-name + Git ref string
  # 3. http[s]://github.<yourEnterprise>.com/owner/theme-name
  # - An enterprise GitHub instance + a GitHub owner + a theme-name string
  # 4. http[s]://github.<yourEnterprise>.com/owner/theme-name@git_ref
  # - An enterprise GitHub instance + a GitHub owner + a theme-name + Git ref string
  #
  # @return [Theme] a new instance of Theme
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:21
  def initialize(raw_theme); end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:53
  def git_ref; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:34
  def host; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:61
  def inspect; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:26
  def name; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:42
  def name_with_owner; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:42
  def nwo; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:30
  def owner; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:57
  def root; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:38
  def scheme; end

  # @return [Boolean]
  #
  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:47
  def valid?; end

  private

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:88
  def gemspec; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:84
  def theme_parts; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:68
  def uri; end

  # source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:92
  def valid_hosts; end
end

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:7
Jekyll::RemoteTheme::Theme::NAME_REGEX = T.let(T.unsafe(nil), Regexp)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:6
Jekyll::RemoteTheme::Theme::OWNER_REGEX = T.let(T.unsafe(nil), Regexp)

# May be a branch, tag, or commit
#
# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:8
Jekyll::RemoteTheme::Theme::REF_REGEX = T.let(T.unsafe(nil), Regexp)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/theme.rb:9
Jekyll::RemoteTheme::Theme::THEME_REGEX = T.let(T.unsafe(nil), Regexp)

# source://jekyll-remote-theme-0.4.3/lib/jekyll-remote-theme/version.rb:5
Jekyll::RemoteTheme::VERSION = T.let(T.unsafe(nil), String)

# source://jekyll-4.2.2/lib/jekyll/version.rb:4
Jekyll::VERSION = T.let(T.unsafe(nil), String)