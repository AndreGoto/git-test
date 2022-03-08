class ApplicationController < ActionController::API
  def verify_signature(payload_body)
    signature = 'sha256=' + OpenSSL::HMAC.hexdigest(
      OpenSSL::Digest.new('sha256'),
      ENV['SECRET_TOKEN'],
      payload_body
    )

    unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
      return halt 500, "Signatures didn't match!"
    end
  end
end
