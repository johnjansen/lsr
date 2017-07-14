class LS
  @frag : Regex?
  @head : Regex?
  @tail : Array(Regex)
  @each : Proc(Tuple(String, File::Stat), Nil)?

  def initialize(tail : Array(Regex), @base = ".", @each = nil)
    @tail = tail.dup
    @head = @tail.shift?
  end

  def each(&block : Tuple(String, File::Stat) -> Nil)
    @each = block
    ls
  end

  protected def ls
    return unless File.directory?(@base)

    Dir.foreach(@base) do |e|
      next if e =~ /^\.*$/
      next unless !!(e =~ @head)

      full_path = File.join(@base, e).sub(/^\.\//, "")

      @each.not_nil!.call({full_path, File.lstat(full_path)}) # if @tail.empty?

      LS.new(@tail, full_path, each: @each).ls if File.directory?(e)
    end
  end
end
