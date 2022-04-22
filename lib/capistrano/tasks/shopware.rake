set :linked_dirs, fetch(:linked_dirs, []).push(
  'config/jwt',
  'files',
  'var/log',
  'public/media',
  'public/thumbnail',
  'public/sitemap'
)

namespace :composer do
  task :install do
    on roles(:app) do
      within release_path do
        execute :composer, "install --prefer-dist --no-interaction --no-dev --optimize-autoloader --no-suggest"
      end
    end
  end
end

namespace :shopware do
  namespace :build do
    namespace :administration do
        task :build do
          invoke! 'bin/build-administration.sh'
        end

    namespace :storefront do
      task :build do
        invoke! 'bin/build-storefront.sh'
      end
    end

  namespace :console do
    task :execute, :param do |t, args|
      on roles(:app) do
        within release_path do
          execute 'bin/console', args[:param]
        end
      end
    end

    task :execute_current, :param do |t, args|
      on roles(:app) do
        within current_path do
          execute 'bin/console', args[:param]
        end
      end
    end

    task :cache_clear do
      invoke! 'shopware:console:execute', 'cache:clear'
    end

    task :maintenance_enable do
      invoke! 'shopware:console:execute_current', 'sales-channel:maintenance:enable --all'
    end

    task :maintenance_disable do
      invoke! 'shopware:console:execute', 'sales-channel:maintenance:disable --all'
    end
  end
end


namespace :deploy do
  after :updated, :shopware do
    invoke 'composer:install'
    invoke 'shopware:console:maintenance_enable'
    invoke 'shopware:build:administration:build'
    invoke 'shopware:build:storefront:build'
  end

  after :published, :shopware do
    invoke 'shopware:console:maintenance_disable'
    invoke 'shopware:console:cache_warmup'
  end
end
