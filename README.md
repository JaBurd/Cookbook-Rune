# Rune

TODO: A whole lot

To leverage this lwrp you need to include recipe[rune] in your run-list as it is
a nasty nasty code-smelling piece of garbage. Hopefully the turd can be polished as time goes on

After adding to your run list you can leverage the rune_deploy function as follows

rune_deploy '18297-geiranger-fjord-1920x1080-nature-wallpaper.jpg' do
  endpoint '<artifactor-url>'
  username '<artifactory-username>'
  password '<artifactory-password>'
  ssl_verify <true or false>
  target '<local directory>'
  repo '<artifactory repo>'
  filename '<name to deploy as>'
  action :deploy
end