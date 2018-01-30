CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'                  
    config.fog_credentials = {
      provider:              'AWS',                        
      aws_access_key_id:     'AKIAJXZ76QUHZ6Q2HSOQ',         

      aws_secret_access_key: 'v6ZSGTxyNaerxntSjuzRoT5TRzvC1U',        

      region:                'ap-northeast-1'    

    }
    config.fog_directory  = 'fullstackbygreg'


  else
    config.storage :file
  end
end