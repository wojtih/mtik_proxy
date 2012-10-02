class MTikProxy::Parser
  def initialize(response)
    @response = reposonse
  end

  def encode
    raise "Unkown resposne format" unless response.is_a?(Array)
    response = response.first
  end
end