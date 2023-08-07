class ErrorSerializer
  def initialize(error, status)
    @error = error
  end

  def serialize_json
    {
      errors: [
        {
          status: status,
          title: @error&.message
        }
      ]
    }
  end
end
