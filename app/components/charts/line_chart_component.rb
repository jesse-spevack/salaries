class Charts::LineChartComponent < ViewComponent::Base
  attr_reader :options, :path
  def initialize(path, specialized_options = {})
    @path = path
    @specialized_options = specialized_options
    @options = all_options
  end

  private

  attr_reader :specialized_options

  def defaults
    {
      download: {filename: path_to_file_name},
      id: path_to_id,
      thousands: ","
    }
  end

  def all_options
    defaults.merge(specialized_options)
  end

  def path_to_file_name
    # Slashes from the download filename string are auto-converted to underscores
    # This removes the initial slash so that the file won't start with an underscore
    path[1..-1]
  end

  def path_to_id
    # convert "/" and "_" from the path to dashes & remove the dash prefix
    path.gsub(/[\\\/-_]/, "-")[1..-1]
  end
end
