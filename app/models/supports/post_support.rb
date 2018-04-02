class Supports::PostSupport
  def initialize post = nil, post_params = nil
    if post_params.present?
      post_params.each do |post_param|
        instance_variable_set "@#{post_param.first}", post_param.last
      end
    end
    @post = post
  end
end
