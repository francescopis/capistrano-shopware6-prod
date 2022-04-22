Gem::Specification.new do |s|
  s.authors = ['Giacomo Mirabassi', 'Davide Borgia', 'Francesco Pisello'
  s.name = %q{capistrano_shopware6_prod}
  s.version = "0.1"
  s.date = %q{2022-04-22}
  s.summary = %q{Capistrano deploy instructions for Shopware 6 production template}
  s.require_paths = ["lib"]
  s.files = `git ls-files`.split($/)
  s.license = "OSL-3.0"
  s.homepage = 'https://github.com/francescopis/capistrano-shopware6-prod'

  s.add_dependency 'capistrano', '~> 3.0'
end
