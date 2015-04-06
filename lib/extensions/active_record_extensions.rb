module Extensions::ActiveRecordExtensions
  def persisted
    select(&:persisted?)
  end
end