default_platform(:android)

platform :android do

  desc 'Build Android'
  lane :publish_staging_version do
    build
    deploy
    message
  end

end
 
lane :get_version_code do
  version_code_from_play_store_strings = google_play_track_version_codes(
    track: "internal",
  )
  version_code_from_play_store_strings[0].to_i + 1
end

desc "Build new staging app"
lane :build do
   new_version_code = get_version_code()
  sh("flutter build appbundle --build-number " + new_version_code.to_s)
end
  
desc "Deploy a new version to the Google Play"
lane :deploy do
  build()
  upload_to_play_store(
    track: 'internal',
    release_status:'draft',
    aab:"../build/app/outputs/bundle/release/app-release.aab",
    skip_upload_apk: true,
  )
end
